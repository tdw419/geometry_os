; DESCRIPTION: Renders a yellow box of size 78x27 starting at (7, 38).
; PLAN: r0=7(x), r1=38(y), r2=78(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 38
LDI r2, 78
LDI r3, 27
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
