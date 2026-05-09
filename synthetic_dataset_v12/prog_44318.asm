; DESCRIPTION: Places a orange line segment connecting (320, 51) to (92, 196).
; PLAN: r0=320(x1), r1=51(y1), r2=92(x2), r3=196(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 51
LDI r2, 92
LDI r3, 196
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
