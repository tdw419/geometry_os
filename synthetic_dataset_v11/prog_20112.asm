; DESCRIPTION: Composite: . Then Renders a magenta disk with center (176, 91) and radius 58. Then Renders a cyan line between points (91, 46) and (109, 238).
; PLAN: r0=176(x), r1=91(y), r2=58(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=91(x1), r1=46(y1), r2=109(x2), r3=238(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a magenta disk with center (176, 91) and radius 58.
; PLAN: r0=176(x), r1=91(y), r2=58(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 91
LDI r2, 58
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a cyan line between points (91, 46) and (109, 238).
; PLAN: r0=91(x1), r1=46(y1), r2=109(x2), r3=238(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 46
LDI r2, 109
LDI r3, 238
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
