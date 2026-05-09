; DESCRIPTION: Renders a yellow box of size 28x19 starting at (225, 207).
; PLAN: r0=225(x), r1=207(y), r2=28(width), r3=19(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 207
LDI r2, 28
LDI r3, 19
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
