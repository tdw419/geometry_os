; DESCRIPTION: Renders a magenta box of size 89x117 starting at (35, 91).
; PLAN: r0=35(x), r1=91(y), r2=89(width), r3=117(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 91
LDI r2, 89
LDI r3, 117
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
