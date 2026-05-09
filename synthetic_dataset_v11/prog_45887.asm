; DESCRIPTION: Creates a cyan rectangular region at (122, 117) spanning 95 by 94 pixels.
; PLAN: r0=122(x), r1=117(y), r2=95(width), r3=94(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 117
LDI r2, 95
LDI r3, 94
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
