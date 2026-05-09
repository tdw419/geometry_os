; DESCRIPTION: Places a yellow 12x31 rectangle at position (315, 67).
; PLAN: r0=315(x), r1=67(y), r2=12(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 67
LDI r2, 12
LDI r3, 31
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
