; DESCRIPTION: Places a purple 70x36 rectangle at position (174, 167).
; PLAN: r0=174(x), r1=167(y), r2=70(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 167
LDI r2, 70
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
