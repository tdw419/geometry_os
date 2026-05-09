; DESCRIPTION: Creates a magenta rectangular region at (302, 209) spanning 84 by 30 pixels.
; PLAN: r0=302(x), r1=209(y), r2=84(width), r3=30(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 209
LDI r2, 84
LDI r3, 30
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
