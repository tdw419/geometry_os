; DESCRIPTION: Places a purple 114x71 rectangle at position (124, 107).
; PLAN: r0=124(x), r1=107(y), r2=114(width), r3=71(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 107
LDI r2, 114
LDI r3, 71
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
