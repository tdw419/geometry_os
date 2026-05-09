; DESCRIPTION: Renders a red box of size 63x94 starting at (304, 20).
; PLAN: r0=304(x), r1=20(y), r2=63(width), r3=94(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 20
LDI r2, 63
LDI r3, 94
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
