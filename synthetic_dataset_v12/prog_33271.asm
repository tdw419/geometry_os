; DESCRIPTION: Places a purple 82x92 rectangle at position (235, 61).
; PLAN: r0=235(x), r1=61(y), r2=82(width), r3=92(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 61
LDI r2, 82
LDI r3, 92
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
