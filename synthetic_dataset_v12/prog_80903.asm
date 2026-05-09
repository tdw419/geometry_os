; DESCRIPTION: Renders a black box of size 22x55 starting at (218, 70).
; PLAN: r0=218(x), r1=70(y), r2=22(width), r3=55(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 70
LDI r2, 22
LDI r3, 55
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
