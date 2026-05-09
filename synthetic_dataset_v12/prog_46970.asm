; DESCRIPTION: Renders a white box of size 53x104 starting at (277, 92).
; PLAN: r0=277(x), r1=92(y), r2=53(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 92
LDI r2, 53
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
