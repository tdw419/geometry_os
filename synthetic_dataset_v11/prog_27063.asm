; DESCRIPTION: Creates a orange rectangular region at (188, 186) spanning 17 by 19 pixels.
; PLAN: r0=188(x), r1=186(y), r2=17(width), r3=19(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 186
LDI r2, 17
LDI r3, 19
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
