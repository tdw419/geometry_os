; DESCRIPTION: Renders a white box of size 97x115 starting at (35, 87).
; PLAN: r0=35(x), r1=87(y), r2=97(width), r3=115(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 87
LDI r2, 97
LDI r3, 115
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
