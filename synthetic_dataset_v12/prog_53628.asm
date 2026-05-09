; DESCRIPTION: Creates a blue rectangular region at (404, 144) spanning 100 by 10 pixels.
; PLAN: r0=404(x), r1=144(y), r2=100(width), r3=10(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 144
LDI r2, 100
LDI r3, 10
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
