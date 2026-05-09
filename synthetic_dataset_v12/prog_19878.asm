; DESCRIPTION: Renders a blue box of size 47x86 starting at (266, 96).
; PLAN: r0=266(x), r1=96(y), r2=47(width), r3=86(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 96
LDI r2, 47
LDI r3, 86
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
