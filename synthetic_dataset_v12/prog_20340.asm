; DESCRIPTION: Renders a magenta box of size 99x39 starting at (160, 61).
; PLAN: r0=160(x), r1=61(y), r2=99(width), r3=39(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 61
LDI r2, 99
LDI r3, 39
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
