; DESCRIPTION: Places a magenta 104x66 rectangle at position (55, 130).
; PLAN: r0=55(x), r1=130(y), r2=104(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 130
LDI r2, 104
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
