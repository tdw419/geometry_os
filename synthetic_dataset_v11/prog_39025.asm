; DESCRIPTION: Draws a green line from (92, 200) to (219, 167).
; PLAN: r0=92(x1), r1=200(y1), r2=219(x2), r3=167(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 200
LDI r2, 219
LDI r3, 167
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
