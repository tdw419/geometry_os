; DESCRIPTION: Places a cyan 68x88 rectangle at position (73, 58).
; PLAN: r0=73(x), r1=58(y), r2=68(width), r3=88(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 58
LDI r2, 68
LDI r3, 88
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
