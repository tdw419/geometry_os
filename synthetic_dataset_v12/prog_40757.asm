; DESCRIPTION: Places a red 88x51 rectangle at position (360, 18).
; PLAN: r0=360(x), r1=18(y), r2=88(width), r3=51(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 18
LDI r2, 88
LDI r3, 51
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
