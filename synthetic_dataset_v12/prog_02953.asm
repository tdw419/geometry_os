; DESCRIPTION: Places a purple 44x87 rectangle at position (137, 66).
; PLAN: r0=137(x), r1=66(y), r2=44(width), r3=87(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 66
LDI r2, 44
LDI r3, 87
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
