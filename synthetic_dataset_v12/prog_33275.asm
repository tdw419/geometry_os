; DESCRIPTION: Creates a red rectangular region at (231, 132) spanning 48 by 22 pixels.
; PLAN: r0=231(x), r1=132(y), r2=48(width), r3=22(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 132
LDI r2, 48
LDI r3, 22
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
