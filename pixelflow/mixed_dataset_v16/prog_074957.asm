; DESCRIPTION: Places a blue 44x32 rectangle at position (440, 157).
; PLAN: r0=440(x), r1=157(y), r2=44(width), r3=32(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 157
LDI r2, 44
LDI r3, 32
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
