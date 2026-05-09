; DESCRIPTION: Places a magenta 92x111 rectangle at position (125, 47).
; PLAN: r0=125(x), r1=47(y), r2=92(width), r3=111(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 47
LDI r2, 92
LDI r3, 111
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
