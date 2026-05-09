; DESCRIPTION: Creates a cyan rectangular region at (149, 133) spanning 94 by 34 pixels.
; PLAN: r0=149(x), r1=133(y), r2=94(width), r3=34(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 133
LDI r2, 94
LDI r3, 34
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
