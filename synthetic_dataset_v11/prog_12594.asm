; DESCRIPTION: Composite: . Then Draws a cyan line from (103, 65) to (174, 180). Then Creates a green circular shape at (88, 133) with radius 64.
; PLAN: r0=103(x1), r1=65(y1), r2=174(x2), r3=180(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=88(x), r1=133(y), r2=64(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a cyan line from (103, 65) to (174, 180).
; PLAN: r0=103(x1), r1=65(y1), r2=174(x2), r3=180(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 65
LDI r2, 174
LDI r3, 180
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a green circular shape at (88, 133) with radius 64.
; PLAN: r0=88(x), r1=133(y), r2=64(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 88
LDI r1, 133
LDI r2, 64
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
