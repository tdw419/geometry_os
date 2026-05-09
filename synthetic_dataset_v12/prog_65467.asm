; DESCRIPTION: Places a magenta 71x111 rectangle at position (219, 25).
; PLAN: r0=219(x), r1=25(y), r2=71(width), r3=111(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 25
LDI r2, 71
LDI r3, 111
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
