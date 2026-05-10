; DESCRIPTION: Places a yellow 15x78 rectangle at position (433, 67).
; PLAN: r0=433(x), r1=67(y), r2=15(width), r3=78(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 67
LDI r2, 15
LDI r3, 78
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
