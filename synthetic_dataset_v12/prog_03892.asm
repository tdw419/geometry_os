; DESCRIPTION: Places a cyan 96x118 rectangle at position (332, 23).
; PLAN: r0=332(x), r1=23(y), r2=96(width), r3=118(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 23
LDI r2, 96
LDI r3, 118
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
