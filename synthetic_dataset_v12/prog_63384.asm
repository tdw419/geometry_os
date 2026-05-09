; DESCRIPTION: Creates a cyan rectangular region at (383, 120) spanning 62 by 105 pixels.
; PLAN: r0=383(x), r1=120(y), r2=62(width), r3=105(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 120
LDI r2, 62
LDI r3, 105
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
