; DESCRIPTION: Places a red 107x69 rectangle at position (353, 136).
; PLAN: r0=353(x), r1=136(y), r2=107(width), r3=69(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 136
LDI r2, 107
LDI r3, 69
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
