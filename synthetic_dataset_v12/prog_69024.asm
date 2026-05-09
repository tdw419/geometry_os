; DESCRIPTION: Renders a purple box of size 61x79 starting at (204, 104).
; PLAN: r0=204(x), r1=104(y), r2=61(width), r3=79(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 104
LDI r2, 61
LDI r3, 79
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
