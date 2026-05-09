; DESCRIPTION: Places a purple 71x24 rectangle at position (130, 47).
; PLAN: r0=130(x), r1=47(y), r2=71(width), r3=24(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 47
LDI r2, 71
LDI r3, 24
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
