; DESCRIPTION: Creates a orange rectangular region at (24, 186) spanning 17 by 47 pixels.
; PLAN: r0=24(x), r1=186(y), r2=17(width), r3=47(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 186
LDI r2, 17
LDI r3, 47
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
