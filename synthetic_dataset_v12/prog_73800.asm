; DESCRIPTION: Places a blue 84x84 rectangle at position (368, 28).
; PLAN: r0=368(x), r1=28(y), r2=84(width), r3=84(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 28
LDI r2, 84
LDI r3, 84
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
