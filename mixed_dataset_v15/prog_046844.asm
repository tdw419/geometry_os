; DESCRIPTION: Places a purple 39x111 box at position (346, 181).
; PLAN: r0=346(x), r1=181(y), r2=39(width), r3=111(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 181
LDI r2, 39
LDI r3, 111
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
