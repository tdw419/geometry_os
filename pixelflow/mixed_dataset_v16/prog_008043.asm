; DESCRIPTION: Renders a magenta box of size 118x113 starting at (61, 59).
; PLAN: r0=61(x), r1=59(y), r2=118(width), r3=113(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 59
LDI r2, 118
LDI r3, 113
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
