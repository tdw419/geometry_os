; DESCRIPTION: Places a purple 98x10 rectangle at position (152, 158).
; PLAN: r0=152(x), r1=158(y), r2=98(width), r3=10(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 158
LDI r2, 98
LDI r3, 10
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
