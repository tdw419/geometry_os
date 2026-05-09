; DESCRIPTION: Creates a green rectangular region at (430, 129) spanning 38 by 28 pixels.
; PLAN: r0=430(x), r1=129(y), r2=38(width), r3=28(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 129
LDI r2, 38
LDI r3, 28
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
