; DESCRIPTION: Renders a black box of size 65x25 starting at (264, 187).
; PLAN: r0=264(x), r1=187(y), r2=65(width), r3=25(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 187
LDI r2, 65
LDI r3, 25
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
