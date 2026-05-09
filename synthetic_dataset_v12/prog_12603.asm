; DESCRIPTION: Creates a green rectangular region at (404, 30) spanning 87 by 16 pixels.
; PLAN: r0=404(x), r1=30(y), r2=87(width), r3=16(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 30
LDI r2, 87
LDI r3, 16
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
