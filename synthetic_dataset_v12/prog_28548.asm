; DESCRIPTION: Places a purple 113x111 rectangle at position (266, 35).
; PLAN: r0=266(x), r1=35(y), r2=113(width), r3=111(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 35
LDI r2, 113
LDI r3, 111
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
