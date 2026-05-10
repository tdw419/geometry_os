; DESCRIPTION: Places a magenta 65x25 rectangle at position (330, 69).
; PLAN: r0=330(x), r1=69(y), r2=65(width), r3=25(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 69
LDI r2, 65
LDI r3, 25
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
