; DESCRIPTION: Renders a magenta box of size 65x19 starting at (305, 44).
; PLAN: r0=305(x), r1=44(y), r2=65(width), r3=19(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 44
LDI r2, 65
LDI r3, 19
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
