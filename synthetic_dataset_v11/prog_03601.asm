; DESCRIPTION: Creates a cyan rectangular region at (208, 167) spanning 42 by 31 pixels.
; PLAN: r0=208(x), r1=167(y), r2=42(width), r3=31(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 167
LDI r2, 42
LDI r3, 31
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
