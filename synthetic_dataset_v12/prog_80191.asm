; DESCRIPTION: Creates a cyan rectangular region at (457, 73) spanning 54 by 28 pixels.
; PLAN: r0=457(x), r1=73(y), r2=54(width), r3=28(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 73
LDI r2, 54
LDI r3, 28
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
