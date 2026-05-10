; DESCRIPTION: Renders a yellow box of size 112x38 starting at (298, 54).
; PLAN: r0=298(x), r1=54(y), r2=112(width), r3=38(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 54
LDI r2, 112
LDI r3, 38
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
