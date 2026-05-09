; DESCRIPTION: Creates a cyan rectangular region at (444, 118) spanning 29 by 39 pixels.
; PLAN: r0=444(x), r1=118(y), r2=29(width), r3=39(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 118
LDI r2, 29
LDI r3, 39
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
