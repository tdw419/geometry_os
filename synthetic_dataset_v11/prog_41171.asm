; DESCRIPTION: Renders a purple box of size 75x86 starting at (65, 67).
; PLAN: r0=65(x), r1=67(y), r2=75(width), r3=86(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 67
LDI r2, 75
LDI r3, 86
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
