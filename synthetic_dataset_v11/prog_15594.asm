; DESCRIPTION: Creates a red rectangular region at (201, 129) spanning 13 by 22 pixels.
; PLAN: r0=201(x), r1=129(y), r2=13(width), r3=22(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 129
LDI r2, 13
LDI r3, 22
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
