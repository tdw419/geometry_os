; DESCRIPTION: Renders a green box of size 31x38 starting at (243, 141).
; PLAN: r0=243(x), r1=141(y), r2=31(width), r3=38(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 141
LDI r2, 31
LDI r3, 38
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
