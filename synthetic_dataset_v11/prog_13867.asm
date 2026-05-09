; DESCRIPTION: Places a yellow 67x39 rectangle at position (127, 123).
; PLAN: r0=127(x), r1=123(y), r2=67(width), r3=39(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 123
LDI r2, 67
LDI r3, 39
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
