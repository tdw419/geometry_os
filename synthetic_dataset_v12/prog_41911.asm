; DESCRIPTION: Creates a yellow rectangular region at (205, 9) spanning 98 by 42 pixels.
; PLAN: r0=205(x), r1=9(y), r2=98(width), r3=42(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 9
LDI r2, 98
LDI r3, 42
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
