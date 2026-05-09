; DESCRIPTION: Places a yellow 99x67 rectangle at position (144, 56).
; PLAN: r0=144(x), r1=56(y), r2=99(width), r3=67(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 56
LDI r2, 99
LDI r3, 67
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
