; DESCRIPTION: Renders a blue box of size 48x46 starting at (248, 193).
; PLAN: r0=248(x), r1=193(y), r2=48(width), r3=46(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 193
LDI r2, 48
LDI r3, 46
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
