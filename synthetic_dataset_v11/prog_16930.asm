; DESCRIPTION: Places a purple 103x71 rectangle at position (109, 160).
; PLAN: r0=109(x), r1=160(y), r2=103(width), r3=71(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 160
LDI r2, 103
LDI r3, 71
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
