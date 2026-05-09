; DESCRIPTION: Creates a cyan rectangular region at (301, 117) spanning 29 by 86 pixels.
; PLAN: r0=301(x), r1=117(y), r2=29(width), r3=86(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 117
LDI r2, 29
LDI r3, 86
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
