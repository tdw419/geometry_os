; DESCRIPTION: Composite: . Then Renders a black line between points (86, 234) and (140, 209). Then Renders a green box of size 107x102 starting at (149, 3).
; PLAN: r0=86(x1), r1=234(y1), r2=140(x2), r3=209(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=149(x), r1=3(y), r2=107(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a black line between points (86, 234) and (140, 209).
; PLAN: r0=86(x1), r1=234(y1), r2=140(x2), r3=209(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 234
LDI r2, 140
LDI r3, 209
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a green box of size 107x102 starting at (149, 3).
; PLAN: r0=149(x), r1=3(y), r2=107(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 3
LDI r2, 107
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
