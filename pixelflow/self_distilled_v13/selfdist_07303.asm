; DESCRIPTION: Places a yellow 99x44 box at position (68, 67).
; PLAN: r0=68(x), r1=67(y), r2=99(width), r3=44(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 67
LDI r2, 99
LDI r3, 44
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
