; DESCRIPTION: Creates a cyan rectangular region at (291, 36) spanning 34 by 83 pixels.
; PLAN: r0=291(x), r1=36(y), r2=34(width), r3=83(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 36
LDI r2, 34
LDI r3, 83
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
