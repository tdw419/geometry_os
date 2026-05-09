; DESCRIPTION: Creates a purple rectangular region at (258, 129) spanning 34 by 18 pixels.
; PLAN: r0=258(x), r1=129(y), r2=34(width), r3=18(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 129
LDI r2, 34
LDI r3, 18
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
