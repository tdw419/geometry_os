; DESCRIPTION: Places a purple 103x104 rectangle at position (50, 24).
; PLAN: r0=50(x), r1=24(y), r2=103(width), r3=104(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 24
LDI r2, 103
LDI r3, 104
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
