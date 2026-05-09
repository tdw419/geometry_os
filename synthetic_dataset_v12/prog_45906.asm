; DESCRIPTION: Places a white 79x51 rectangle at position (375, 74).
; PLAN: r0=375(x), r1=74(y), r2=79(width), r3=51(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 74
LDI r2, 79
LDI r3, 51
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
