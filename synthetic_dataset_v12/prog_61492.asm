; DESCRIPTION: Renders a blue box of size 38x63 starting at (226, 117).
; PLAN: r0=226(x), r1=117(y), r2=38(width), r3=63(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 117
LDI r2, 38
LDI r3, 63
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
