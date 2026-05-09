; DESCRIPTION: Renders a purple box of size 28x60 starting at (403, 155).
; PLAN: r0=403(x), r1=155(y), r2=28(width), r3=60(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 155
LDI r2, 28
LDI r3, 60
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
