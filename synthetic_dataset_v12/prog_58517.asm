; DESCRIPTION: Creates a red rectangular region at (231, 18) spanning 36 by 26 pixels.
; PLAN: r0=231(x), r1=18(y), r2=36(width), r3=26(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 18
LDI r2, 36
LDI r3, 26
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
