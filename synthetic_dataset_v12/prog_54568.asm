; DESCRIPTION: Renders a yellow box of size 57x38 starting at (395, 95).
; PLAN: r0=395(x), r1=95(y), r2=57(width), r3=38(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 95
LDI r2, 57
LDI r3, 38
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
