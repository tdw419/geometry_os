; DESCRIPTION: Renders a blue box of size 102x95 starting at (208, 21).
; PLAN: r0=208(x), r1=21(y), r2=102(width), r3=95(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 21
LDI r2, 102
LDI r3, 95
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
