; DESCRIPTION: Places a white 60x104 rectangle at position (145, 100).
; PLAN: r0=145(x), r1=100(y), r2=60(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 100
LDI r2, 60
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
