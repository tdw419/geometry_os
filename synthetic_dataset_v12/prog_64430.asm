; DESCRIPTION: Places a blue 53x33 rectangle at position (178, 167).
; PLAN: r0=178(x), r1=167(y), r2=53(width), r3=33(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 167
LDI r2, 53
LDI r3, 33
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
