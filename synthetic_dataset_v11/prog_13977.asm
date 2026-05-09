; DESCRIPTION: Places a red circle of radius 67 at center (171, 133).
; PLAN: r0=171(x), r1=133(y), r2=67(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 171
LDI r1, 133
LDI r2, 67
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
