; DESCRIPTION: Places a purple 90x38 rectangle at position (189, 197).
; PLAN: r0=189(x), r1=197(y), r2=90(width), r3=38(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 197
LDI r2, 90
LDI r3, 38
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
