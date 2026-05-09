; DESCRIPTION: Renders a magenta box of size 44x77 starting at (349, 89).
; PLAN: r0=349(x), r1=89(y), r2=44(width), r3=77(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 89
LDI r2, 44
LDI r3, 77
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
