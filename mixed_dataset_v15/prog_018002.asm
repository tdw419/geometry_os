; DESCRIPTION: Places a blue 32x45 box at position (1, 19).
; PLAN: r0=1(x), r1=19(y), r2=32(width), r3=45(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 19
LDI r2, 32
LDI r3, 45
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
