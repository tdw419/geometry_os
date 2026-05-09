; DESCRIPTION: Places a purple 99x19 rectangle at position (237, 83).
; PLAN: r0=237(x), r1=83(y), r2=99(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 83
LDI r2, 99
LDI r3, 19
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
