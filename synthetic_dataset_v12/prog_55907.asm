; DESCRIPTION: Creates a green rectangular region at (186, 98) spanning 59 by 26 pixels.
; PLAN: r0=186(x), r1=98(y), r2=59(width), r3=26(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 98
LDI r2, 59
LDI r3, 26
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
