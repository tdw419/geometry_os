; DESCRIPTION: Creates a orange rectangular region at (66, 46) spanning 120 by 42 pixels.
; PLAN: r0=66(x), r1=46(y), r2=120(width), r3=42(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 46
LDI r2, 120
LDI r3, 42
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
