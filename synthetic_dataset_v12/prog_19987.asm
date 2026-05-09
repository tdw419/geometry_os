; DESCRIPTION: Renders a magenta box of size 75x86 starting at (129, 162).
; PLAN: r0=129(x), r1=162(y), r2=75(width), r3=86(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 162
LDI r2, 75
LDI r3, 86
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
