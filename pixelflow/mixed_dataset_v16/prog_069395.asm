; DESCRIPTION: Creates a cyan rectangular region at (339, 112) spanning 112 by 94 pixels.
; PLAN: r0=339(x), r1=112(y), r2=112(width), r3=94(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 112
LDI r2, 112
LDI r3, 94
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
