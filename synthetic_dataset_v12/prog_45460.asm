; DESCRIPTION: Renders a yellow box of size 38x97 starting at (176, 75).
; PLAN: r0=176(x), r1=75(y), r2=38(width), r3=97(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 75
LDI r2, 38
LDI r3, 97
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
