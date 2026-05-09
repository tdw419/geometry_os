; DESCRIPTION: Renders a yellow box of size 94x70 starting at (171, 69).
; PLAN: r0=171(x), r1=69(y), r2=94(width), r3=70(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 69
LDI r2, 94
LDI r3, 70
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
