; DESCRIPTION: Renders a purple box of size 83x86 starting at (151, 104).
; PLAN: r0=151(x), r1=104(y), r2=83(width), r3=86(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 104
LDI r2, 83
LDI r3, 86
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
