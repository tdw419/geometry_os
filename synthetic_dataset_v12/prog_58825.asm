; DESCRIPTION: Renders a yellow box of size 15x39 starting at (475, 61).
; PLAN: r0=475(x), r1=61(y), r2=15(width), r3=39(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 61
LDI r2, 15
LDI r3, 39
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
