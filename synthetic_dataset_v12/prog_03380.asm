; DESCRIPTION: Places a purple 11x45 rectangle at position (125, 28).
; PLAN: r0=125(x), r1=28(y), r2=11(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 28
LDI r2, 11
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
