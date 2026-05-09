; DESCRIPTION: Places a purple 36x111 rectangle at position (357, 127).
; PLAN: r0=357(x), r1=127(y), r2=36(width), r3=111(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 127
LDI r2, 36
LDI r3, 111
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
