; DESCRIPTION: Creates a red filled rectangle of size 49x51 starting at (215, 89).
; PLAN: r0=215(x), r1=89(y), r2=49(width), r3=51(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 89
LDI r2, 49
LDI r3, 51
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
