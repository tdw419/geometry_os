; DESCRIPTION: Places a magenta 45x55 rectangle at position (152, 183).
; PLAN: r0=152(x), r1=183(y), r2=45(width), r3=55(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 183
LDI r2, 45
LDI r3, 55
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
