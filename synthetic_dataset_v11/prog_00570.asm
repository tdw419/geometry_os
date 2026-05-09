; DESCRIPTION: Places a magenta 33x92 rectangle at position (111, 108).
; PLAN: r0=111(x), r1=108(y), r2=33(width), r3=92(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 108
LDI r2, 33
LDI r3, 92
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
