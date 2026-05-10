; DESCRIPTION: Places a blue 21x37 rectangle at position (210, 92).
; PLAN: r0=210(x), r1=92(y), r2=21(width), r3=37(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 92
LDI r2, 21
LDI r3, 37
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
