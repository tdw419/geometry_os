; DESCRIPTION: Draws a black line from (173, 219) to (21, 228).
; PLAN: r0=173(x1), r1=219(y1), r2=21(x2), r3=228(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 219
LDI r2, 21
LDI r3, 228
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
