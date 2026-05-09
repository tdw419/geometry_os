; DESCRIPTION: Places a blue 15x40 rectangle at position (75, 59).
; PLAN: r0=75(x), r1=59(y), r2=15(width), r3=40(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 59
LDI r2, 15
LDI r3, 40
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
