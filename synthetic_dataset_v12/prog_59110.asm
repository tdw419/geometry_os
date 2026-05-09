; DESCRIPTION: Creates a green rectangular region at (446, 6) spanning 14 by 47 pixels.
; PLAN: r0=446(x), r1=6(y), r2=14(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 6
LDI r2, 14
LDI r3, 47
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
