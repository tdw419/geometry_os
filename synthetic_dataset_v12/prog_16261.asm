; DESCRIPTION: Creates a orange rectangular region at (141, 86) spanning 42 by 17 pixels.
; PLAN: r0=141(x), r1=86(y), r2=42(width), r3=17(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 86
LDI r2, 42
LDI r3, 17
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
