; DESCRIPTION: Creates a magenta rectangular region at (209, 87) spanning 17 by 50 pixels.
; PLAN: r0=209(x), r1=87(y), r2=17(width), r3=50(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 87
LDI r2, 17
LDI r3, 50
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
