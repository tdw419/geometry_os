; DESCRIPTION: Renders a yellow box of size 65x56 starting at (90, 192).
; PLAN: r0=90(x), r1=192(y), r2=65(width), r3=56(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 192
LDI r2, 65
LDI r3, 56
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
