; DESCRIPTION: Renders a purple box of size 103x104 starting at (1, 73).
; PLAN: r0=1(x), r1=73(y), r2=103(width), r3=104(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 73
LDI r2, 103
LDI r3, 104
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
