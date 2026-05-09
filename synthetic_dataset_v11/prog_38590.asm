; DESCRIPTION: Creates a cyan rectangular region at (23, 81) spanning 119 by 42 pixels.
; PLAN: r0=23(x), r1=81(y), r2=119(width), r3=42(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 81
LDI r2, 119
LDI r3, 42
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
