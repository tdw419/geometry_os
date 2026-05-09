; DESCRIPTION: Places a blue 22x87 rectangle at position (436, 59).
; PLAN: r0=436(x), r1=59(y), r2=22(width), r3=87(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 59
LDI r2, 22
LDI r3, 87
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
