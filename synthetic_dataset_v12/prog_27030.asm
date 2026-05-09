; DESCRIPTION: Creates a yellow rectangular region at (370, 74) spanning 65 by 47 pixels.
; PLAN: r0=370(x), r1=74(y), r2=65(width), r3=47(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 74
LDI r2, 65
LDI r3, 47
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
