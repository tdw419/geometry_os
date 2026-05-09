; DESCRIPTION: Renders a magenta box of size 44x120 starting at (160, 127).
; PLAN: r0=160(x), r1=127(y), r2=44(width), r3=120(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 127
LDI r2, 44
LDI r3, 120
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
