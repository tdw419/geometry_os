; DESCRIPTION: Renders a yellow box of size 44x103 starting at (175, 20).
; PLAN: r0=175(x), r1=20(y), r2=44(width), r3=103(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 20
LDI r2, 44
LDI r3, 103
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
