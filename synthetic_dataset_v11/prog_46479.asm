; DESCRIPTION: Places a blue 50x69 rectangle at position (169, 137).
; PLAN: r0=169(x), r1=137(y), r2=50(width), r3=69(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 137
LDI r2, 50
LDI r3, 69
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
