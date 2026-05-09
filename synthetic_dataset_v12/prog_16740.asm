; DESCRIPTION: Creates a cyan rectangular region at (147, 52) spanning 98 by 60 pixels.
; PLAN: r0=147(x), r1=52(y), r2=98(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 52
LDI r2, 98
LDI r3, 60
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
