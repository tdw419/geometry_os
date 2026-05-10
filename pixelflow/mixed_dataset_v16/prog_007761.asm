; DESCRIPTION: Places a yellow 25x58 rectangle at position (99, 166).
; PLAN: r0=99(x), r1=166(y), r2=25(width), r3=58(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 166
LDI r2, 25
LDI r3, 58
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
