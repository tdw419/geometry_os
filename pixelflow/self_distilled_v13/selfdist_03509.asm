; DESCRIPTION: Places a orange 22x102 box at position (53, 90).
; PLAN: r0=53(x), r1=90(y), r2=22(width), r3=102(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 90
LDI r2, 22
LDI r3, 102
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
