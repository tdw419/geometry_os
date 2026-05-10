; DESCRIPTION: Places a purple 33x93 rectangle at position (283, 141).
; PLAN: r0=283(x), r1=141(y), r2=33(width), r3=93(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 141
LDI r2, 33
LDI r3, 93
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
