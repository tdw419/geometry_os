; DESCRIPTION: Renders a yellow box of size 87x46 starting at (408, 90).
; PLAN: r0=408(x), r1=90(y), r2=87(width), r3=46(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 90
LDI r2, 87
LDI r3, 46
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
