; DESCRIPTION: Renders a purple box of size 56x60 starting at (404, 182).
; PLAN: r0=404(x), r1=182(y), r2=56(width), r3=60(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 182
LDI r2, 56
LDI r3, 60
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
