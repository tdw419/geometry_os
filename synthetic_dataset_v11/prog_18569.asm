; DESCRIPTION: Places a magenta 78x111 rectangle at position (108, 127).
; PLAN: r0=108(x), r1=127(y), r2=78(width), r3=111(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 127
LDI r2, 78
LDI r3, 111
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
