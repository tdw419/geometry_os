; DESCRIPTION: Renders a yellow box of size 22x39 starting at (131, 214).
; PLAN: r0=131(x), r1=214(y), r2=22(width), r3=39(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 214
LDI r2, 22
LDI r3, 39
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
