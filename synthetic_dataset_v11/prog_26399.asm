; DESCRIPTION: Places a purple 103x18 rectangle at position (147, 113).
; PLAN: r0=147(x), r1=113(y), r2=103(width), r3=18(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 113
LDI r2, 103
LDI r3, 18
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
