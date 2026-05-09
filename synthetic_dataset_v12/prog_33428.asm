; DESCRIPTION: Creates a cyan rectangular region at (309, 179) spanning 27 by 68 pixels.
; PLAN: r0=309(x), r1=179(y), r2=27(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 179
LDI r2, 27
LDI r3, 68
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
