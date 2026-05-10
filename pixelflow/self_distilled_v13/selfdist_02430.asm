; DESCRIPTION: Places a red 40x49 box at position (388, 191).
; PLAN: r0=388(x), r1=191(y), r2=40(width), r3=49(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 191
LDI r2, 40
LDI r3, 49
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
