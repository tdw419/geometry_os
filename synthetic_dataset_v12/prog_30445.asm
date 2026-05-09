; DESCRIPTION: Places a purple 17x57 rectangle at position (188, 182).
; PLAN: r0=188(x), r1=182(y), r2=17(width), r3=57(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 182
LDI r2, 17
LDI r3, 57
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
