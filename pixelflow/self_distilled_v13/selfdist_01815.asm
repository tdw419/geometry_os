; DESCRIPTION: Places a white 106x71 box at position (219, 114).
; PLAN: r0=219(x), r1=114(y), r2=106(width), r3=71(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 114
LDI r2, 106
LDI r3, 71
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
