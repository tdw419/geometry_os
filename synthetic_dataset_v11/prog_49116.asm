; DESCRIPTION: Places a black 99x15 rectangle at position (65, 74).
; PLAN: r0=65(x), r1=74(y), r2=99(width), r3=15(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 74
LDI r2, 99
LDI r3, 15
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
