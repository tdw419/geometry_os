; DESCRIPTION: Creates a red filled rectangle of size 96x84 starting at (309, 8).
; PLAN: r0=309(x), r1=8(y), r2=96(width), r3=84(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 8
LDI r2, 96
LDI r3, 84
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
