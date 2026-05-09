; DESCRIPTION: Places a purple 11x44 rectangle at position (176, 177).
; PLAN: r0=176(x), r1=177(y), r2=11(width), r3=44(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 177
LDI r2, 11
LDI r3, 44
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
