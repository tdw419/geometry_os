; DESCRIPTION: Renders a yellow box of size 83x72 starting at (48, 108).
; PLAN: r0=48(x), r1=108(y), r2=83(width), r3=72(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 108
LDI r2, 83
LDI r3, 72
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
