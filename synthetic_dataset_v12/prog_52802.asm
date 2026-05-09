; DESCRIPTION: Places a purple 41x96 rectangle at position (412, 113).
; PLAN: r0=412(x), r1=113(y), r2=41(width), r3=96(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 113
LDI r2, 41
LDI r3, 96
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
