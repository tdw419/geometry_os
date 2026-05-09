; DESCRIPTION: Creates a cyan rectangular region at (176, 73) spanning 94 by 38 pixels.
; PLAN: r0=176(x), r1=73(y), r2=94(width), r3=38(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 73
LDI r2, 94
LDI r3, 38
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
