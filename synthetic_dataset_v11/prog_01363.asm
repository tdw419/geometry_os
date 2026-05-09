; DESCRIPTION: Renders a purple box of size 21x30 starting at (209, 104).
; PLAN: r0=209(x), r1=104(y), r2=21(width), r3=30(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 104
LDI r2, 21
LDI r3, 30
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
