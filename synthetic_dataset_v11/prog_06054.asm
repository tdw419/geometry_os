; DESCRIPTION: Creates a orange rectangular region at (162, 205) spanning 44 by 42 pixels.
; PLAN: r0=162(x), r1=205(y), r2=44(width), r3=42(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 205
LDI r2, 44
LDI r3, 42
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
