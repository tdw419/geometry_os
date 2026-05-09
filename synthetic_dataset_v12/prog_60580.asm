; DESCRIPTION: Creates a orange rectangular region at (70, 144) spanning 42 by 49 pixels.
; PLAN: r0=70(x), r1=144(y), r2=42(width), r3=49(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 144
LDI r2, 42
LDI r3, 49
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
