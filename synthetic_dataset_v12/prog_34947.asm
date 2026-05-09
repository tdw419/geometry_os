; DESCRIPTION: Places a black 25x37 rectangle at position (264, 114).
; PLAN: r0=264(x), r1=114(y), r2=25(width), r3=37(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 114
LDI r2, 25
LDI r3, 37
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
