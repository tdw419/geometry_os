; DESCRIPTION: Creates a cyan rectangular region at (383, 180) spanning 83 by 13 pixels.
; PLAN: r0=383(x), r1=180(y), r2=83(width), r3=13(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 180
LDI r2, 83
LDI r3, 13
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
