; DESCRIPTION: Places a yellow 86x58 rectangle at position (232, 6).
; PLAN: r0=232(x), r1=6(y), r2=86(width), r3=58(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 6
LDI r2, 86
LDI r3, 58
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
