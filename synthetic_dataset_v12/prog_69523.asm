; DESCRIPTION: Renders a magenta box of size 36x19 starting at (305, 23).
; PLAN: r0=305(x), r1=23(y), r2=36(width), r3=19(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 23
LDI r2, 36
LDI r3, 19
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
