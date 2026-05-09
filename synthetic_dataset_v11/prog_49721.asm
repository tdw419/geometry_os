; DESCRIPTION: Places a orange line segment connecting (228, 233) to (173, 184).
; PLAN: r0=228(x1), r1=233(y1), r2=173(x2), r3=184(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 233
LDI r2, 173
LDI r3, 184
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
