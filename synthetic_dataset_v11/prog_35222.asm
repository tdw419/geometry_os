; DESCRIPTION: Creates a green rectangular region at (135, 127) spanning 59 by 47 pixels.
; PLAN: r0=135(x), r1=127(y), r2=59(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 127
LDI r2, 59
LDI r3, 47
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
