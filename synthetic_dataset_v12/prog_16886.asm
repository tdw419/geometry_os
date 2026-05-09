; DESCRIPTION: Places a purple 107x43 rectangle at position (157, 186).
; PLAN: r0=157(x), r1=186(y), r2=107(width), r3=43(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 186
LDI r2, 107
LDI r3, 43
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
