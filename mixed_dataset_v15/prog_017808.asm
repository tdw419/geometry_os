; DESCRIPTION: Places a yellow 63x74 box at position (67, 16).
; PLAN: r0=67(x), r1=16(y), r2=63(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 16
LDI r2, 63
LDI r3, 74
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
