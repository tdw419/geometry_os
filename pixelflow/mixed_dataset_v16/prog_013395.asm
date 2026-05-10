; DESCRIPTION: Places a blue 24x32 box at position (104, 175).
; PLAN: r0=104(x), r1=175(y), r2=24(width), r3=32(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 175
LDI r2, 24
LDI r3, 32
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
