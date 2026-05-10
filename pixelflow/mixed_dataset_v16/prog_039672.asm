; DESCRIPTION: Creates a blue rectangular region at (227, 129) spanning 120 by 40 pixels.
; PLAN: r0=227(x), r1=129(y), r2=120(width), r3=40(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 129
LDI r2, 120
LDI r3, 40
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
