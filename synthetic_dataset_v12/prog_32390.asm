; DESCRIPTION: Creates a orange rectangular region at (208, 38) spanning 81 by 36 pixels.
; PLAN: r0=208(x), r1=38(y), r2=81(width), r3=36(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 38
LDI r2, 81
LDI r3, 36
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
