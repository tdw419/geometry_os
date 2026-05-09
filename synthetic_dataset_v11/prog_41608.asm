; DESCRIPTION: Composite: . Then Renders a orange line between points (112, 181) and (157, 108). Then Sets a single cyan pixel at (28, 136).
; PLAN: r0=112(x1), r1=181(y1), r2=157(x2), r3=108(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=28(x), r1=136(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a orange line between points (112, 181) and (157, 108).
; PLAN: r0=112(x1), r1=181(y1), r2=157(x2), r3=108(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 181
LDI r2, 157
LDI r3, 108
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single cyan pixel at (28, 136).
; PLAN: r0=28(x), r1=136(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 28
LDI r1, 136
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
