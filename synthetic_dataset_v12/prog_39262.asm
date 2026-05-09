; DESCRIPTION: Places a yellow 86x44 rectangle at position (307, 155).
; PLAN: r0=307(x), r1=155(y), r2=86(width), r3=44(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 155
LDI r2, 86
LDI r3, 44
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
