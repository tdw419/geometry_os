; DESCRIPTION: Renders a white box of size 115x99 starting at (121, 46).
; PLAN: r0=121(x), r1=46(y), r2=115(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 46
LDI r2, 115
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
