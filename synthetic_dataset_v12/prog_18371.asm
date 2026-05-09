; DESCRIPTION: Renders a magenta box of size 98x39 starting at (185, 16).
; PLAN: r0=185(x), r1=16(y), r2=98(width), r3=39(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 16
LDI r2, 98
LDI r3, 39
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
