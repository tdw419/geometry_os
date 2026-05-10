; DESCRIPTION: Places a purple 40x95 rectangle at position (330, 115).
; PLAN: r0=330(x), r1=115(y), r2=40(width), r3=95(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 115
LDI r2, 40
LDI r3, 95
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
