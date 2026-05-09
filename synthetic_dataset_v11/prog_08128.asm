; DESCRIPTION: Places a purple 90x32 rectangle at position (124, 202).
; PLAN: r0=124(x), r1=202(y), r2=90(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 202
LDI r2, 90
LDI r3, 32
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
