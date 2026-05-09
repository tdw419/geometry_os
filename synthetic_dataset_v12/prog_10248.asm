; DESCRIPTION: Places a blue 59x25 rectangle at position (1, 65).
; PLAN: r0=1(x), r1=65(y), r2=59(width), r3=25(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 65
LDI r2, 59
LDI r3, 25
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
