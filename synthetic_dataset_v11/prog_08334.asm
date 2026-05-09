; DESCRIPTION: Places a white circle of radius 67 at center (85, 174).
; PLAN: r0=85(x), r1=174(y), r2=67(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 85
LDI r1, 174
LDI r2, 67
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
