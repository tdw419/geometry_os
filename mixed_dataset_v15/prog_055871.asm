; DESCRIPTION: Renders a magenta box of size 23x24 starting at (380, 160).
; PLAN: r0=380(x), r1=160(y), r2=23(width), r3=24(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 160
LDI r2, 23
LDI r3, 24
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
