; DESCRIPTION: Creates a cyan rectangular region at (39, 204) spanning 62 by 14 pixels.
; PLAN: r0=39(x), r1=204(y), r2=62(width), r3=14(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 204
LDI r2, 62
LDI r3, 14
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
