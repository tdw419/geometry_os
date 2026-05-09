; DESCRIPTION: Creates a green rectangular region at (400, 129) spanning 44 by 90 pixels.
; PLAN: r0=400(x), r1=129(y), r2=44(width), r3=90(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 129
LDI r2, 44
LDI r3, 90
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
