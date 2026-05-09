; DESCRIPTION: Places a purple 108x109 rectangle at position (393, 100).
; PLAN: r0=393(x), r1=100(y), r2=108(width), r3=109(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 100
LDI r2, 108
LDI r3, 109
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
