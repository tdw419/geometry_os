; DESCRIPTION: Composite: . Then Renders a magenta disk with center (137, 164) and radius 54. Then Draws a cyan line from (187, 11) to (20, 92).
; PLAN: r0=137(x), r1=164(y), r2=54(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=187(x1), r1=11(y1), r2=20(x2), r3=92(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a magenta disk with center (137, 164) and radius 54.
; PLAN: r0=137(x), r1=164(y), r2=54(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 137
LDI r1, 164
LDI r2, 54
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a cyan line from (187, 11) to (20, 92).
; PLAN: r0=187(x1), r1=11(y1), r2=20(x2), r3=92(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 11
LDI r2, 20
LDI r3, 92
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
