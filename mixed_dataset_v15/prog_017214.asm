; DESCRIPTION: Creates a green rectangular region at (406, 50) spanning 93 by 98 pixels.
; PLAN: r0=406(x), r1=50(y), r2=93(width), r3=98(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 50
LDI r2, 93
LDI r3, 98
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
