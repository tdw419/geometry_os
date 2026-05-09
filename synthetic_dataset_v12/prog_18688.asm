; DESCRIPTION: Creates a blue rectangular region at (94, 129) spanning 54 by 25 pixels.
; PLAN: r0=94(x), r1=129(y), r2=54(width), r3=25(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 129
LDI r2, 54
LDI r3, 25
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
