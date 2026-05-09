; DESCRIPTION: Places a purple 79x44 rectangle at position (159, 10).
; PLAN: r0=159(x), r1=10(y), r2=79(width), r3=44(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 10
LDI r2, 79
LDI r3, 44
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
