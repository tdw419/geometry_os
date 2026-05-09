; DESCRIPTION: Places a yellow 18x35 rectangle at position (371, 163).
; PLAN: r0=371(x), r1=163(y), r2=18(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 163
LDI r2, 18
LDI r3, 35
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
