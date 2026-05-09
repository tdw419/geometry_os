; DESCRIPTION: Places a purple 78x44 rectangle at position (132, 196).
; PLAN: r0=132(x), r1=196(y), r2=78(width), r3=44(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 196
LDI r2, 78
LDI r3, 44
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
