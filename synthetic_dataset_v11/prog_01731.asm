; DESCRIPTION: Creates a yellow rectangular region at (12, 129) spanning 29 by 106 pixels.
; PLAN: r0=12(x), r1=129(y), r2=29(width), r3=106(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 129
LDI r2, 29
LDI r3, 106
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
