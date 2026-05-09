; DESCRIPTION: Places a green 98x37 rectangle at position (347, 67).
; PLAN: r0=347(x), r1=67(y), r2=98(width), r3=37(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 67
LDI r2, 98
LDI r3, 37
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
