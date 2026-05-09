; DESCRIPTION: Places a orange line segment connecting (143, 173) to (256, 107).
; PLAN: r0=143(x1), r1=173(y1), r2=256(x2), r3=107(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 173
LDI r2, 256
LDI r3, 107
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
