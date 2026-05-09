; DESCRIPTION: Places a green 98x104 rectangle at position (112, 90).
; PLAN: r0=112(x), r1=90(y), r2=98(width), r3=104(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 90
LDI r2, 98
LDI r3, 104
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
