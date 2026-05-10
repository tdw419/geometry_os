; DESCRIPTION: Places a magenta 58x22 box at position (288, 40).
; PLAN: r0=288(x), r1=40(y), r2=58(width), r3=22(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 40
LDI r2, 58
LDI r3, 22
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
