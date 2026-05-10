; DESCRIPTION: Places a yellow 36x78 box at position (74, 20).
; PLAN: r0=74(x), r1=20(y), r2=36(width), r3=78(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 20
LDI r2, 36
LDI r3, 78
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
