; DESCRIPTION: Renders a yellow box of size 116x65 starting at (45, 54).
; PLAN: r0=45(x), r1=54(y), r2=116(width), r3=65(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 54
LDI r2, 116
LDI r3, 65
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
