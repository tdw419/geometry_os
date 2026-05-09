; DESCRIPTION: Creates a cyan rectangular region at (428, 147) spanning 31 by 107 pixels.
; PLAN: r0=428(x), r1=147(y), r2=31(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 147
LDI r2, 31
LDI r3, 107
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
