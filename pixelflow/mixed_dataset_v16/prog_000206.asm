; DESCRIPTION: Renders a black box of size 44x102 starting at (294, 98).
; PLAN: r0=294(x), r1=98(y), r2=44(width), r3=102(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 98
LDI r2, 44
LDI r3, 102
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
