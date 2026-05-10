; DESCRIPTION: Creates a green rectangular region at (406, 59) spanning 86 by 82 pixels.
; PLAN: r0=406(x), r1=59(y), r2=86(width), r3=82(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 59
LDI r2, 86
LDI r3, 82
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
