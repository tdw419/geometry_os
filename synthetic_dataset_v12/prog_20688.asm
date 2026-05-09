; DESCRIPTION: Places a red 46x69 rectangle at position (360, 23).
; PLAN: r0=360(x), r1=23(y), r2=46(width), r3=69(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 23
LDI r2, 46
LDI r3, 69
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
