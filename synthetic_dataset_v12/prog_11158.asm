; DESCRIPTION: Renders a magenta box of size 118x24 starting at (317, 146).
; PLAN: r0=317(x), r1=146(y), r2=118(width), r3=24(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 146
LDI r2, 118
LDI r3, 24
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
