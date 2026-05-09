; DESCRIPTION: Places a purple 49x69 rectangle at position (235, 54).
; PLAN: r0=235(x), r1=54(y), r2=49(width), r3=69(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 54
LDI r2, 49
LDI r3, 69
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
