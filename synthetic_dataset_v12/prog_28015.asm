; DESCRIPTION: Renders a green line between points (43, 214) and (288, 95).
; PLAN: r0=43(x1), r1=214(y1), r2=288(x2), r3=95(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 214
LDI r2, 288
LDI r3, 95
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
