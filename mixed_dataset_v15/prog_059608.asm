; DESCRIPTION: Creates a yellow rectangular region at (434, 133) spanning 10 by 112 pixels.
; PLAN: r0=434(x), r1=133(y), r2=10(width), r3=112(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 133
LDI r2, 10
LDI r3, 112
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
