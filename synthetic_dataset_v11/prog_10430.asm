; DESCRIPTION: Draws a black line from (173, 64) to (107, 118).
; PLAN: r0=173(x1), r1=64(y1), r2=107(x2), r3=118(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 64
LDI r2, 107
LDI r3, 118
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
