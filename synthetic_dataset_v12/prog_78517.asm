; DESCRIPTION: Creates a cyan rectangular region at (208, 186) spanning 107 by 31 pixels.
; PLAN: r0=208(x), r1=186(y), r2=107(width), r3=31(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 186
LDI r2, 107
LDI r3, 31
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
