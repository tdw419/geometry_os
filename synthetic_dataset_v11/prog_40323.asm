; DESCRIPTION: Places a purple 113x48 rectangle at position (123, 30).
; PLAN: r0=123(x), r1=30(y), r2=113(width), r3=48(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 30
LDI r2, 113
LDI r3, 48
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
