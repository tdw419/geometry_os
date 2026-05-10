; DESCRIPTION: Renders a magenta box of size 118x89 starting at (362, 146).
; PLAN: r0=362(x), r1=146(y), r2=118(width), r3=89(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 146
LDI r2, 118
LDI r3, 89
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
