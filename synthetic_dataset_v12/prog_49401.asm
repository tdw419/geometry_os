; DESCRIPTION: Renders a yellow box of size 21x28 starting at (117, 191).
; PLAN: r0=117(x), r1=191(y), r2=21(width), r3=28(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 191
LDI r2, 21
LDI r3, 28
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
