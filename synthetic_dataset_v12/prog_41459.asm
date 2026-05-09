; DESCRIPTION: Places a yellow 80x32 rectangle at position (181, 87).
; PLAN: r0=181(x), r1=87(y), r2=80(width), r3=32(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 87
LDI r2, 80
LDI r3, 32
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
