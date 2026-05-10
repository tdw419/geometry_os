; DESCRIPTION: Places a magenta 117x98 rectangle at position (222, 58).
; PLAN: r0=222(x), r1=58(y), r2=117(width), r3=98(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 58
LDI r2, 117
LDI r3, 98
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
