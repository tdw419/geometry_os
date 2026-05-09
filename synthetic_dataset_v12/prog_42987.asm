; DESCRIPTION: Places a cyan 18x88 rectangle at position (56, 96).
; PLAN: r0=56(x), r1=96(y), r2=18(width), r3=88(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 96
LDI r2, 18
LDI r3, 88
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
