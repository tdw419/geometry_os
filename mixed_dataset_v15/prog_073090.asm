; DESCRIPTION: Renders a yellow box of size 45x57 starting at (412, 167).
; PLAN: r0=412(x), r1=167(y), r2=45(width), r3=57(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 167
LDI r2, 45
LDI r3, 57
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
