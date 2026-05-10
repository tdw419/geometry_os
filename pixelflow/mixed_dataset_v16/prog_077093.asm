; DESCRIPTION: Renders a green box of size 38x111 starting at (94, 20).
; PLAN: r0=94(x), r1=20(y), r2=38(width), r3=111(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 20
LDI r2, 38
LDI r3, 111
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
