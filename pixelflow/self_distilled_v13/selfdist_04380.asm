; DESCRIPTION: Renders a purple rectangular region spanning 57 by 110 at (320, 80).
; PLAN: r0=320(x), r1=80(y), r2=57(width), r3=110(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 80
LDI r2, 57
LDI r3, 110
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
