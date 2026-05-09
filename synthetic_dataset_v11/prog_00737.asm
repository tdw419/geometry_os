; DESCRIPTION: Places a green 67x55 rectangle at position (147, 1).
; PLAN: r0=147(x), r1=1(y), r2=67(width), r3=55(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 1
LDI r2, 67
LDI r3, 55
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
