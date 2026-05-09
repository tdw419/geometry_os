; DESCRIPTION: Creates a blue rectangular region at (404, 5) spanning 63 by 11 pixels.
; PLAN: r0=404(x), r1=5(y), r2=63(width), r3=11(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 5
LDI r2, 63
LDI r3, 11
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
