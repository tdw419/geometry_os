; DESCRIPTION: Renders a yellow box of size 67x49 starting at (33, 82).
; PLAN: r0=33(x), r1=82(y), r2=67(width), r3=49(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 82
LDI r2, 67
LDI r3, 49
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
