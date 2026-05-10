; DESCRIPTION: Places a magenta 91x69 rectangle at position (292, 76).
; PLAN: r0=292(x), r1=76(y), r2=91(width), r3=69(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 76
LDI r2, 91
LDI r3, 69
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
