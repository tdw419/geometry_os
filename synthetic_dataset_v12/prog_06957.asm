; DESCRIPTION: Places a purple 85x105 rectangle at position (138, 134).
; PLAN: r0=138(x), r1=134(y), r2=85(width), r3=105(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 134
LDI r2, 85
LDI r3, 105
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
