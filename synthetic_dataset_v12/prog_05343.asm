; DESCRIPTION: Renders a yellow box of size 116x67 starting at (248, 83).
; PLAN: r0=248(x), r1=83(y), r2=116(width), r3=67(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 83
LDI r2, 116
LDI r3, 67
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
