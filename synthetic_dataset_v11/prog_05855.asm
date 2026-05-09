; DESCRIPTION: Renders a blue box of size 97x27 starting at (116, 132).
; PLAN: r0=116(x), r1=132(y), r2=97(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 132
LDI r2, 97
LDI r3, 27
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
