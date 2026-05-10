; DESCRIPTION: Places a blue 17x99 rectangle at position (481, 109).
; PLAN: r0=481(x), r1=109(y), r2=17(width), r3=99(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 109
LDI r2, 17
LDI r3, 99
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
