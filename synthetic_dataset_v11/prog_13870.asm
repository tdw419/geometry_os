; DESCRIPTION: Places a magenta 49x65 rectangle at position (45, 28).
; PLAN: r0=45(x), r1=28(y), r2=49(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 28
LDI r2, 49
LDI r3, 65
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
