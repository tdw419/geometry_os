; DESCRIPTION: Places a red 88x28 box at position (176, 85).
; PLAN: r0=176(x), r1=85(y), r2=88(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 85
LDI r2, 88
LDI r3, 28
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
