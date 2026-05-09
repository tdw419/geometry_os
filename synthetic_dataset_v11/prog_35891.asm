; DESCRIPTION: Places a orange 63x69 rectangle at position (45, 169).
; PLAN: r0=45(x), r1=169(y), r2=63(width), r3=69(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 169
LDI r2, 63
LDI r3, 69
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
