; DESCRIPTION: Renders a magenta box of size 24x86 starting at (188, 35).
; PLAN: r0=188(x), r1=35(y), r2=24(width), r3=86(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 35
LDI r2, 24
LDI r3, 86
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
