; DESCRIPTION: Creates a cyan rectangular region at (141, 143) spanning 94 by 55 pixels.
; PLAN: r0=141(x), r1=143(y), r2=94(width), r3=55(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 143
LDI r2, 94
LDI r3, 55
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
