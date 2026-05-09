; DESCRIPTION: Renders a yellow box of size 90x46 starting at (47, 103).
; PLAN: r0=47(x), r1=103(y), r2=90(width), r3=46(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 103
LDI r2, 90
LDI r3, 46
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
