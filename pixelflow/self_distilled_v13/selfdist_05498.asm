; DESCRIPTION: Renders a green rectangular region spanning 56 by 104 at (126, 180).
; PLAN: r0=126(x), r1=180(y), r2=56(width), r3=104(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 180
LDI r2, 56
LDI r3, 104
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
