; DESCRIPTION: Places a purple 10x99 rectangle at position (103, 82).
; PLAN: r0=103(x), r1=82(y), r2=10(width), r3=99(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 82
LDI r2, 10
LDI r3, 99
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
