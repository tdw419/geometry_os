; DESCRIPTION: Places a purple 102x115 rectangle at position (292, 130).
; PLAN: r0=292(x), r1=130(y), r2=102(width), r3=115(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 130
LDI r2, 102
LDI r3, 115
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
