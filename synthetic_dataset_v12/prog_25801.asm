; DESCRIPTION: Creates a yellow rectangular region at (365, 74) spanning 26 by 99 pixels.
; PLAN: r0=365(x), r1=74(y), r2=26(width), r3=99(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 74
LDI r2, 26
LDI r3, 99
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
