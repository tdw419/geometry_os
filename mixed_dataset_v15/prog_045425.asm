; DESCRIPTION: Renders a magenta box of size 54x86 starting at (417, 52).
; PLAN: r0=417(x), r1=52(y), r2=54(width), r3=86(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 52
LDI r2, 54
LDI r3, 86
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
