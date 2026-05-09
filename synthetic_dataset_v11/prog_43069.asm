; DESCRIPTION: Places a blue 47x76 rectangle at position (183, 167).
; PLAN: r0=183(x), r1=167(y), r2=47(width), r3=76(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 167
LDI r2, 47
LDI r3, 76
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
