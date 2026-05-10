; DESCRIPTION: Renders a magenta rectangular region spanning 58 by 108 at (320, 45).
; PLAN: r0=320(x), r1=45(y), r2=58(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 45
LDI r2, 58
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
