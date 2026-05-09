; DESCRIPTION: Creates a orange rectangular region at (54, 60) spanning 17 by 86 pixels.
; PLAN: r0=54(x), r1=60(y), r2=17(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 60
LDI r2, 17
LDI r3, 86
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
