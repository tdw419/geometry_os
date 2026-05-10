; DESCRIPTION: Renders a blue box of size 57x27 starting at (172, 23).
; PLAN: r0=172(x), r1=23(y), r2=57(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 23
LDI r2, 57
LDI r3, 27
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
