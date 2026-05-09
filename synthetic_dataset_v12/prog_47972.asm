; DESCRIPTION: Creates a cyan rectangular region at (101, 38) spanning 74 by 46 pixels.
; PLAN: r0=101(x), r1=38(y), r2=74(width), r3=46(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 38
LDI r2, 74
LDI r3, 46
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
