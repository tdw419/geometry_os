; DESCRIPTION: Places a blue 38x69 rectangle at position (161, 165).
; PLAN: r0=161(x), r1=165(y), r2=38(width), r3=69(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 165
LDI r2, 38
LDI r3, 69
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
