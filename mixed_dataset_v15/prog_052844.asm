; DESCRIPTION: Places a purple 79x113 rectangle at position (15, 120).
; PLAN: r0=15(x), r1=120(y), r2=79(width), r3=113(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 120
LDI r2, 79
LDI r3, 113
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
