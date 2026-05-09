; DESCRIPTION: Places a purple 34x111 rectangle at position (82, 66).
; PLAN: r0=82(x), r1=66(y), r2=34(width), r3=111(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 66
LDI r2, 34
LDI r3, 111
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
