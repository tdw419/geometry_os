; DESCRIPTION: Renders a yellow box of size 65x80 starting at (445, 17).
; PLAN: r0=445(x), r1=17(y), r2=65(width), r3=80(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 17
LDI r2, 65
LDI r3, 80
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
