; DESCRIPTION: Places a blue 32x59 box at position (48, 12).
; PLAN: r0=48(x), r1=12(y), r2=32(width), r3=59(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 12
LDI r2, 32
LDI r3, 59
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
