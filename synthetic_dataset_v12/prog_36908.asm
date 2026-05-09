; DESCRIPTION: Places a purple 98x111 rectangle at position (35, 16).
; PLAN: r0=35(x), r1=16(y), r2=98(width), r3=111(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 16
LDI r2, 98
LDI r3, 111
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
