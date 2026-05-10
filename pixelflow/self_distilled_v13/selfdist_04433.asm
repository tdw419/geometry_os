; DESCRIPTION: Renders a green rectangular region spanning 116 by 59 at (347, 169).
; PLAN: r0=347(x), r1=169(y), r2=116(width), r3=59(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 169
LDI r2, 116
LDI r3, 59
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
