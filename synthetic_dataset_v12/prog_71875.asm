; DESCRIPTION: Places a purple 16x43 rectangle at position (425, 167).
; PLAN: r0=425(x), r1=167(y), r2=16(width), r3=43(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 167
LDI r2, 16
LDI r3, 43
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
