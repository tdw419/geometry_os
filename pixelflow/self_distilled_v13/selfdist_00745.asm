; DESCRIPTION: Places a green 67x104 box at position (374, 44).
; PLAN: r0=374(x), r1=44(y), r2=67(width), r3=104(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 44
LDI r2, 67
LDI r3, 104
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
