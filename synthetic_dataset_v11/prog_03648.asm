; DESCRIPTION: Renders a yellow box of size 12x57 starting at (214, 193).
; PLAN: r0=214(x), r1=193(y), r2=12(width), r3=57(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 193
LDI r2, 12
LDI r3, 57
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
