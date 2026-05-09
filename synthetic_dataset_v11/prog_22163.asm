; DESCRIPTION: Places a yellow 45x104 rectangle at position (127, 20).
; PLAN: r0=127(x), r1=20(y), r2=45(width), r3=104(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 20
LDI r2, 45
LDI r3, 104
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
