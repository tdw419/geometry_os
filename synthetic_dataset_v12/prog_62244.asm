; DESCRIPTION: Places a purple 46x52 rectangle at position (125, 60).
; PLAN: r0=125(x), r1=60(y), r2=46(width), r3=52(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 60
LDI r2, 46
LDI r3, 52
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
