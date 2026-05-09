; DESCRIPTION: Creates a cyan rectangular region at (124, 39) spanning 62 by 90 pixels.
; PLAN: r0=124(x), r1=39(y), r2=62(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 39
LDI r2, 62
LDI r3, 90
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
