; DESCRIPTION: Creates a cyan rectangular region at (463, 109) spanning 29 by 39 pixels.
; PLAN: r0=463(x), r1=109(y), r2=29(width), r3=39(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 109
LDI r2, 29
LDI r3, 39
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
