; DESCRIPTION: Places a purple 16x26 rectangle at position (177, 56).
; PLAN: r0=177(x), r1=56(y), r2=16(width), r3=26(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 56
LDI r2, 16
LDI r3, 26
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
