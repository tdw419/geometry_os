; DESCRIPTION: Places a black 70x70 rectangle at position (95, 69).
; PLAN: r0=95(x), r1=69(y), r2=70(width), r3=70(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 69
LDI r2, 70
LDI r3, 70
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
