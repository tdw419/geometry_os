; DESCRIPTION: Renders a magenta box of size 94x39 starting at (321, 196).
; PLAN: r0=321(x), r1=196(y), r2=94(width), r3=39(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 196
LDI r2, 94
LDI r3, 39
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
