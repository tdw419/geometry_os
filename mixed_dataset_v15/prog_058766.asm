; DESCRIPTION: Creates a cyan rectangular region at (274, 26) spanning 97 by 42 pixels.
; PLAN: r0=274(x), r1=26(y), r2=97(width), r3=42(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 26
LDI r2, 97
LDI r3, 42
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
