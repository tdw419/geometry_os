; DESCRIPTION: Places a yellow 98x104 rectangle at position (270, 91).
; PLAN: r0=270(x), r1=91(y), r2=98(width), r3=104(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 91
LDI r2, 98
LDI r3, 104
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
