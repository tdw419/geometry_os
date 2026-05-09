; DESCRIPTION: Places a purple 96x50 rectangle at position (285, 132).
; PLAN: r0=285(x), r1=132(y), r2=96(width), r3=50(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 132
LDI r2, 96
LDI r3, 50
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
