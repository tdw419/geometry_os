; DESCRIPTION: Creates a yellow rectangular region at (320, 131) spanning 59 by 37 pixels.
; PLAN: r0=320(x), r1=131(y), r2=59(width), r3=37(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 131
LDI r2, 59
LDI r3, 37
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
