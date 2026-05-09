; DESCRIPTION: Places a purple 106x55 rectangle at position (177, 128).
; PLAN: r0=177(x), r1=128(y), r2=106(width), r3=55(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 128
LDI r2, 106
LDI r3, 55
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
