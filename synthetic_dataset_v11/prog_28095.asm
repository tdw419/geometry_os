; DESCRIPTION: Places a purple 116x20 rectangle at position (3, 235).
; PLAN: r0=3(x), r1=235(y), r2=116(width), r3=20(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 235
LDI r2, 116
LDI r3, 20
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
