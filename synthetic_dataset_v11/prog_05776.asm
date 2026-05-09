; DESCRIPTION: Creates a cyan rectangular region at (109, 63) spanning 26 by 37 pixels.
; PLAN: r0=109(x), r1=63(y), r2=26(width), r3=37(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 63
LDI r2, 26
LDI r3, 37
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
