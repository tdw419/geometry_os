; DESCRIPTION: Places a purple 120x73 rectangle at position (113, 130).
; PLAN: r0=113(x), r1=130(y), r2=120(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 130
LDI r2, 120
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
