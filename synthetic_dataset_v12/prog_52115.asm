; DESCRIPTION: Places a purple 120x24 rectangle at position (71, 25).
; PLAN: r0=71(x), r1=25(y), r2=120(width), r3=24(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 25
LDI r2, 120
LDI r3, 24
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
