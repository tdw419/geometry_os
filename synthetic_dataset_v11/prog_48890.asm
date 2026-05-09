; DESCRIPTION: Creates a orange rectangular region at (186, 36) spanning 25 by 105 pixels.
; PLAN: r0=186(x), r1=36(y), r2=25(width), r3=105(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 36
LDI r2, 25
LDI r3, 105
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
