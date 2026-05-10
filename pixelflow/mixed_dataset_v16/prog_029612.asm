; DESCRIPTION: Creates a white rectangular region at (18, 129) spanning 112 by 53 pixels.
; PLAN: r0=18(x), r1=129(y), r2=112(width), r3=53(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 129
LDI r2, 112
LDI r3, 53
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
