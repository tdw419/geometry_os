; DESCRIPTION: Places a magenta 22x58 rectangle at position (45, 33).
; PLAN: r0=45(x), r1=33(y), r2=22(width), r3=58(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 33
LDI r2, 22
LDI r3, 58
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
