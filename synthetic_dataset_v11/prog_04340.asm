; DESCRIPTION: Composite: . Then Renders a yellow disk with center (98, 63) and radius 36. Then Draws a black line from (92, 164) to (176, 36).
; PLAN: r0=98(x), r1=63(y), r2=36(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=92(x1), r1=164(y1), r2=176(x2), r3=36(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a yellow disk with center (98, 63) and radius 36.
; PLAN: r0=98(x), r1=63(y), r2=36(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 98
LDI r1, 63
LDI r2, 36
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a black line from (92, 164) to (176, 36).
; PLAN: r0=92(x1), r1=164(y1), r2=176(x2), r3=36(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 164
LDI r2, 176
LDI r3, 36
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
