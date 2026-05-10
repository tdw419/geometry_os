; DESCRIPTION: Creates a cyan rectangular region at (7, 29) spanning 39 by 100 pixels.
; PLAN: r0=7(x), r1=29(y), r2=39(width), r3=100(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 29
LDI r2, 39
LDI r3, 100
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
