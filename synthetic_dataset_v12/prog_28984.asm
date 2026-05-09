; DESCRIPTION: Places a magenta 65x98 rectangle at position (137, 92).
; PLAN: r0=137(x), r1=92(y), r2=65(width), r3=98(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 92
LDI r2, 65
LDI r3, 98
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
