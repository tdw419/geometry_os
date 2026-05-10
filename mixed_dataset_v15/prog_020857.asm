; DESCRIPTION: Places a blue 20x46 rectangle at position (477, 87).
; PLAN: r0=477(x), r1=87(y), r2=20(width), r3=46(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 87
LDI r2, 20
LDI r3, 46
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
