; DESCRIPTION: Creates a green rectangular region at (186, 129) spanning 114 by 12 pixels.
; PLAN: r0=186(x), r1=129(y), r2=114(width), r3=12(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 129
LDI r2, 114
LDI r3, 12
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
