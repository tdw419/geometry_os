; DESCRIPTION: Places a purple 120x120 rectangle at position (63, 10).
; PLAN: r0=63(x), r1=10(y), r2=120(width), r3=120(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 10
LDI r2, 120
LDI r3, 120
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
