; DESCRIPTION: Renders a white box of size 57x87 starting at (250, 116).
; PLAN: r0=250(x), r1=116(y), r2=57(width), r3=87(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 116
LDI r2, 57
LDI r3, 87
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
