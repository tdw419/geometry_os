; DESCRIPTION: Composite: . Then Draws a cyan line from (218, 50) to (213, 120). Then Renders a yellow disk with center (150, 95) and radius 73.
; PLAN: r0=218(x1), r1=50(y1), r2=213(x2), r3=120(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=150(x), r1=95(y), r2=73(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a cyan line from (218, 50) to (213, 120).
; PLAN: r0=218(x1), r1=50(y1), r2=213(x2), r3=120(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 50
LDI r2, 213
LDI r3, 120
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a yellow disk with center (150, 95) and radius 73.
; PLAN: r0=150(x), r1=95(y), r2=73(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 150
LDI r1, 95
LDI r2, 73
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
