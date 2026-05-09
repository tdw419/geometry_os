; DESCRIPTION: Renders a green box of size 46x78 starting at (19, 171).
; PLAN: r0=19(x), r1=171(y), r2=46(width), r3=78(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 171
LDI r2, 46
LDI r3, 78
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
