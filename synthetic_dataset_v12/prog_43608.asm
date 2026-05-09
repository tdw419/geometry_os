; DESCRIPTION: Places a purple 119x113 rectangle at position (368, 48).
; PLAN: r0=368(x), r1=48(y), r2=119(width), r3=113(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 48
LDI r2, 119
LDI r3, 113
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
