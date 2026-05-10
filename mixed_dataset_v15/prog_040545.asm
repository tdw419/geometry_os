; DESCRIPTION: Places a black 74x51 rectangle at position (364, 177).
; PLAN: r0=364(x), r1=177(y), r2=74(width), r3=51(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 177
LDI r2, 74
LDI r3, 51
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
