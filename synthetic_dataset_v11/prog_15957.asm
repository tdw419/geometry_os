; DESCRIPTION: Renders a purple box of size 48x86 starting at (159, 133).
; PLAN: r0=159(x), r1=133(y), r2=48(width), r3=86(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 133
LDI r2, 48
LDI r3, 86
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
