; DESCRIPTION: Renders a purple box of size 91x14 starting at (124, 215).
; PLAN: r0=124(x), r1=215(y), r2=91(width), r3=14(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 215
LDI r2, 91
LDI r3, 14
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
