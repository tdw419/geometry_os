; DESCRIPTION: Places a purple 98x72 rectangle at position (19, 125).
; PLAN: r0=19(x), r1=125(y), r2=98(width), r3=72(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 125
LDI r2, 98
LDI r3, 72
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
