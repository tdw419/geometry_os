; DESCRIPTION: Creates a orange rectangular region at (205, 154) spanning 61 by 44 pixels.
; PLAN: r0=205(x), r1=154(y), r2=61(width), r3=44(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 154
LDI r2, 61
LDI r3, 44
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
