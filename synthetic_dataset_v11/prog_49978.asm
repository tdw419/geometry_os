; DESCRIPTION: Creates a cyan rectangular region at (54, 57) spanning 34 by 81 pixels.
; PLAN: r0=54(x), r1=57(y), r2=34(width), r3=81(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 57
LDI r2, 34
LDI r3, 81
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
