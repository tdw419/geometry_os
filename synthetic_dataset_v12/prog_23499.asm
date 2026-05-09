; DESCRIPTION: Renders a magenta box of size 39x110 starting at (315, 93).
; PLAN: r0=315(x), r1=93(y), r2=39(width), r3=110(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 93
LDI r2, 39
LDI r3, 110
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
