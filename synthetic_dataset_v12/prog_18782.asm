; DESCRIPTION: Renders a yellow box of size 52x65 starting at (16, 95).
; PLAN: r0=16(x), r1=95(y), r2=52(width), r3=65(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 95
LDI r2, 52
LDI r3, 65
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
