; DESCRIPTION: Composite: . Then Renders a cyan disk with center (150, 99) and radius 69. Then Draws a green line from (3, 76) to (82, 180).
; PLAN: r0=150(x), r1=99(y), r2=69(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=3(x1), r1=76(y1), r2=82(x2), r3=180(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a cyan disk with center (150, 99) and radius 69.
; PLAN: r0=150(x), r1=99(y), r2=69(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 150
LDI r1, 99
LDI r2, 69
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a green line from (3, 76) to (82, 180).
; PLAN: r0=3(x1), r1=76(y1), r2=82(x2), r3=180(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 76
LDI r2, 82
LDI r3, 180
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
