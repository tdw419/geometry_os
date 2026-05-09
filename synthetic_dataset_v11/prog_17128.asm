; DESCRIPTION: Creates a cyan rectangular region at (208, 147) spanning 26 by 98 pixels.
; PLAN: r0=208(x), r1=147(y), r2=26(width), r3=98(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 147
LDI r2, 26
LDI r3, 98
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
