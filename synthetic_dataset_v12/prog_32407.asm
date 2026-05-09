; DESCRIPTION: Renders a black box of size 83x30 starting at (229, 59).
; PLAN: r0=229(x), r1=59(y), r2=83(width), r3=30(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 59
LDI r2, 83
LDI r3, 30
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
