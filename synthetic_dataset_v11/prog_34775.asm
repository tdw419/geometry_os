; DESCRIPTION: Renders a yellow box of size 38x96 starting at (213, 54).
; PLAN: r0=213(x), r1=54(y), r2=38(width), r3=96(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 54
LDI r2, 38
LDI r3, 96
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
