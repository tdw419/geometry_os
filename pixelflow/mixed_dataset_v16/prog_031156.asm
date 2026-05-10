; DESCRIPTION: Places a green 88x96 rectangle at position (252, 124).
; PLAN: r0=252(x), r1=124(y), r2=88(width), r3=96(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 124
LDI r2, 88
LDI r3, 96
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
