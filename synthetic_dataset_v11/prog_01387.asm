; DESCRIPTION: Creates a green rectangular region at (170, 98) spanning 38 by 120 pixels.
; PLAN: r0=170(x), r1=98(y), r2=38(width), r3=120(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 98
LDI r2, 38
LDI r3, 120
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
