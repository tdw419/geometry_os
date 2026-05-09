; DESCRIPTION: Renders a magenta box of size 80x115 starting at (98, 45).
; PLAN: r0=98(x), r1=45(y), r2=80(width), r3=115(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 45
LDI r2, 80
LDI r3, 115
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
