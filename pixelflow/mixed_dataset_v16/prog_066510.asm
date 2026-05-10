; DESCRIPTION: Places a purple 17x71 rectangle at position (54, 83).
; PLAN: r0=54(x), r1=83(y), r2=17(width), r3=71(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 83
LDI r2, 17
LDI r3, 71
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
