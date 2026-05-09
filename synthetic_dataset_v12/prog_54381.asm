; DESCRIPTION: Creates a orange rectangular region at (417, 186) spanning 64 by 42 pixels.
; PLAN: r0=417(x), r1=186(y), r2=64(width), r3=42(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 186
LDI r2, 64
LDI r3, 42
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
