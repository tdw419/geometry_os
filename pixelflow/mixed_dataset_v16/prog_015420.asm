; DESCRIPTION: Draws a black line from (173, 233) to (375, 241).
; PLAN: r0=173(x1), r1=233(y1), r2=375(x2), r3=241(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 233
LDI r2, 375
LDI r3, 241
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
