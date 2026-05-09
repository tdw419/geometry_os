; DESCRIPTION: Renders a magenta box of size 90x23 starting at (103, 65).
; PLAN: r0=103(x), r1=65(y), r2=90(width), r3=23(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 65
LDI r2, 90
LDI r3, 23
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
