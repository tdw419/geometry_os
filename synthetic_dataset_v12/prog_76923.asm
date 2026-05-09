; DESCRIPTION: Renders a cyan box of size 119x96 starting at (314, 59).
; PLAN: r0=314(x), r1=59(y), r2=119(width), r3=96(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 59
LDI r2, 119
LDI r3, 96
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
