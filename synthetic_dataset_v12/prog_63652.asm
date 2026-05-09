; DESCRIPTION: Places a blue 34x51 rectangle at position (293, 28).
; PLAN: r0=293(x), r1=28(y), r2=34(width), r3=51(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 28
LDI r2, 34
LDI r3, 51
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
