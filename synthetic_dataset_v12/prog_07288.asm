; DESCRIPTION: Places a purple 50x29 rectangle at position (113, 200).
; PLAN: r0=113(x), r1=200(y), r2=50(width), r3=29(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 200
LDI r2, 50
LDI r3, 29
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
