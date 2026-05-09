; DESCRIPTION: Renders a purple box of size 48x108 starting at (173, 86).
; PLAN: r0=173(x), r1=86(y), r2=48(width), r3=108(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 86
LDI r2, 48
LDI r3, 108
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
