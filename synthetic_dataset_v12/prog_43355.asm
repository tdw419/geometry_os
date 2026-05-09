; DESCRIPTION: Renders a yellow box of size 53x102 starting at (198, 61).
; PLAN: r0=198(x), r1=61(y), r2=53(width), r3=102(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 61
LDI r2, 53
LDI r3, 102
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
