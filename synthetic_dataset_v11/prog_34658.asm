; DESCRIPTION: Renders a magenta box of size 22x71 starting at (198, 75).
; PLAN: r0=198(x), r1=75(y), r2=22(width), r3=71(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 75
LDI r2, 22
LDI r3, 71
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
