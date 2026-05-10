; DESCRIPTION: Creates a cyan rectangular region at (274, 174) spanning 88 by 80 pixels.
; PLAN: r0=274(x), r1=174(y), r2=88(width), r3=80(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 174
LDI r2, 88
LDI r3, 80
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
