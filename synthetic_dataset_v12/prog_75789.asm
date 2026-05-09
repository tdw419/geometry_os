; DESCRIPTION: Places a yellow 39x101 rectangle at position (264, 84).
; PLAN: r0=264(x), r1=84(y), r2=39(width), r3=101(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 84
LDI r2, 39
LDI r3, 101
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
