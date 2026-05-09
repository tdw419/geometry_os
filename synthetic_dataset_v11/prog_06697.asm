; DESCRIPTION: Renders a yellow box of size 97x55 starting at (70, 19).
; PLAN: r0=70(x), r1=19(y), r2=97(width), r3=55(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 19
LDI r2, 97
LDI r3, 55
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
