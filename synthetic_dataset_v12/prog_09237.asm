; DESCRIPTION: Creates a blue rectangular region at (189, 129) spanning 58 by 28 pixels.
; PLAN: r0=189(x), r1=129(y), r2=58(width), r3=28(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 129
LDI r2, 58
LDI r3, 28
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
