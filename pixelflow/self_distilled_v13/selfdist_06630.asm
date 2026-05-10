; DESCRIPTION: Places a blue 45x104 box at position (202, 180).
; PLAN: r0=202(x), r1=180(y), r2=45(width), r3=104(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 180
LDI r2, 45
LDI r3, 104
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
