; DESCRIPTION: Places a yellow 44x45 rectangle at position (181, 67).
; PLAN: r0=181(x), r1=67(y), r2=44(width), r3=45(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 67
LDI r2, 44
LDI r3, 45
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
