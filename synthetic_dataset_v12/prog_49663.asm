; DESCRIPTION: Renders a red box of size 91x89 starting at (197, 47).
; PLAN: r0=197(x), r1=47(y), r2=91(width), r3=89(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 47
LDI r2, 91
LDI r3, 89
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
