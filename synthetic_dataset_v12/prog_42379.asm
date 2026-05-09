; DESCRIPTION: Renders a black box of size 117x63 starting at (169, 111).
; PLAN: r0=169(x), r1=111(y), r2=117(width), r3=63(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 111
LDI r2, 117
LDI r3, 63
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
