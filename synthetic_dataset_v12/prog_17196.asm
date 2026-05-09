; DESCRIPTION: Creates a blue rectangular region at (419, 129) spanning 90 by 112 pixels.
; PLAN: r0=419(x), r1=129(y), r2=90(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 129
LDI r2, 90
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
