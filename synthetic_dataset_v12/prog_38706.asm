; DESCRIPTION: Renders a yellow box of size 55x44 starting at (161, 200).
; PLAN: r0=161(x), r1=200(y), r2=55(width), r3=44(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 200
LDI r2, 55
LDI r3, 44
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
