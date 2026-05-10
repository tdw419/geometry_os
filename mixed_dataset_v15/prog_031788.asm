; DESCRIPTION: Creates a green rectangular region at (333, 132) spanning 59 by 116 pixels.
; PLAN: r0=333(x), r1=132(y), r2=59(width), r3=116(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 132
LDI r2, 59
LDI r3, 116
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
