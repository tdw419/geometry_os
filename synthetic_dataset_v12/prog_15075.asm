; DESCRIPTION: Places a black 114x63 rectangle at position (220, 175).
; PLAN: r0=220(x), r1=175(y), r2=114(width), r3=63(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 175
LDI r2, 114
LDI r3, 63
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
