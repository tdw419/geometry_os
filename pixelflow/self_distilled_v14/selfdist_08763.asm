; DESCRIPTION: Places a yellow 18x49 box at position (0, 135).
; PLAN: r0=0(x), r1=135(y), r2=18(width), r3=49(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 135
LDI r2, 18
LDI r3, 49
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
