; DESCRIPTION: Renders a yellow box of size 98x46 starting at (269, 46).
; PLAN: r0=269(x), r1=46(y), r2=98(width), r3=46(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 46
LDI r2, 98
LDI r3, 46
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
