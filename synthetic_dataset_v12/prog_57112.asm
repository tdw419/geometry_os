; DESCRIPTION: Creates a cyan rectangular region at (363, 38) spanning 86 by 115 pixels.
; PLAN: r0=363(x), r1=38(y), r2=86(width), r3=115(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 38
LDI r2, 86
LDI r3, 115
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
