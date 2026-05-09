; DESCRIPTION: Renders a purple box of size 54x84 starting at (404, 33).
; PLAN: r0=404(x), r1=33(y), r2=54(width), r3=84(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 33
LDI r2, 54
LDI r3, 84
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
