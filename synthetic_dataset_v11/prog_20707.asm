; DESCRIPTION: Composite: . Then Places a blue line segment connecting (194, 205) to (187, 146). Then Renders a red disk with center (131, 134) and radius 71.
; PLAN: r0=194(x1), r1=205(y1), r2=187(x2), r3=146(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=131(x), r1=134(y), r2=71(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a blue line segment connecting (194, 205) to (187, 146).
; PLAN: r0=194(x1), r1=205(y1), r2=187(x2), r3=146(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 205
LDI r2, 187
LDI r3, 146
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a red disk with center (131, 134) and radius 71.
; PLAN: r0=131(x), r1=134(y), r2=71(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 134
LDI r2, 71
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
