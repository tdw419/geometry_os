; DESCRIPTION: Renders a yellow box of size 70x18 starting at (154, 167).
; PLAN: r0=154(x), r1=167(y), r2=70(width), r3=18(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 167
LDI r2, 70
LDI r3, 18
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
