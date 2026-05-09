; DESCRIPTION: Renders a purple box of size 18x72 starting at (27, 5).
; PLAN: r0=27(x), r1=5(y), r2=18(width), r3=72(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 5
LDI r2, 18
LDI r3, 72
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
