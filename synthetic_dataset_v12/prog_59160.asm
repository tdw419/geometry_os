; DESCRIPTION: Creates a green rectangular region at (404, 209) spanning 48 by 43 pixels.
; PLAN: r0=404(x), r1=209(y), r2=48(width), r3=43(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 209
LDI r2, 48
LDI r3, 43
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
