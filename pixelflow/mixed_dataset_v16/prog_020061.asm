; DESCRIPTION: Creates a orange rectangular region at (329, 28) spanning 115 by 42 pixels.
; PLAN: r0=329(x), r1=28(y), r2=115(width), r3=42(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 28
LDI r2, 115
LDI r3, 42
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
