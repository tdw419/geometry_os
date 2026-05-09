; DESCRIPTION: Composite: . Then Draws a cyan line from (172, 254) to (18, 98). Then Renders a magenta disk with center (215, 34) and radius 23.
; PLAN: r0=172(x1), r1=254(y1), r2=18(x2), r3=98(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=215(x), r1=34(y), r2=23(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a cyan line from (172, 254) to (18, 98).
; PLAN: r0=172(x1), r1=254(y1), r2=18(x2), r3=98(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 254
LDI r2, 18
LDI r3, 98
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a magenta disk with center (215, 34) and radius 23.
; PLAN: r0=215(x), r1=34(y), r2=23(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 215
LDI r1, 34
LDI r2, 23
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
