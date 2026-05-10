; DESCRIPTION: Places a black 105x77 rectangle at position (222, 167).
; PLAN: r0=222(x), r1=167(y), r2=105(width), r3=77(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 167
LDI r2, 105
LDI r3, 77
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
