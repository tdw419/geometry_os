; DESCRIPTION: Places a purple 12x40 rectangle at position (292, 129).
; PLAN: r0=292(x), r1=129(y), r2=12(width), r3=40(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 129
LDI r2, 12
LDI r3, 40
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
