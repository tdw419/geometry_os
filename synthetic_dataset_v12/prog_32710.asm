; DESCRIPTION: Places a purple 51x71 rectangle at position (37, 164).
; PLAN: r0=37(x), r1=164(y), r2=51(width), r3=71(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 164
LDI r2, 51
LDI r3, 71
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
