; DESCRIPTION: Creates a cyan rectangular region at (186, 94) spanning 49 by 88 pixels.
; PLAN: r0=186(x), r1=94(y), r2=49(width), r3=88(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 94
LDI r2, 49
LDI r3, 88
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
