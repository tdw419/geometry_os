; DESCRIPTION: Places a purple 110x16 rectangle at position (31, 236).
; PLAN: r0=31(x), r1=236(y), r2=110(width), r3=16(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 236
LDI r2, 110
LDI r3, 16
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
