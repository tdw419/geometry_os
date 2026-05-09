; DESCRIPTION: Draws a yellow line from (460, 137) to (23, 219).
; PLAN: r0=460(x1), r1=137(y1), r2=23(x2), r3=219(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 137
LDI r2, 23
LDI r3, 219
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
