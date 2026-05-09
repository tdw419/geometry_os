; DESCRIPTION: Renders a white box of size 38x99 starting at (140, 46).
; PLAN: r0=140(x), r1=46(y), r2=38(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 46
LDI r2, 38
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
