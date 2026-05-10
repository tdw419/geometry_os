; DESCRIPTION: Renders a black box of size 59x87 starting at (321, 61).
; PLAN: r0=321(x), r1=61(y), r2=59(width), r3=87(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 61
LDI r2, 59
LDI r3, 87
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
