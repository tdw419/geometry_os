; DESCRIPTION: Renders a purple box of size 104x21 starting at (28, 9).
; PLAN: r0=28(x), r1=9(y), r2=104(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 9
LDI r2, 104
LDI r3, 21
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
