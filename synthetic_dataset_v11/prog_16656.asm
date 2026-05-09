; DESCRIPTION: Places a purple 33x73 rectangle at position (212, 126).
; PLAN: r0=212(x), r1=126(y), r2=33(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 126
LDI r2, 33
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
