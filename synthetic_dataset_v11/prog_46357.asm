; DESCRIPTION: Composite: . Then Creates a white circular shape at (146, 127) with radius 73. Then Renders a cyan line between points (55, 195) and (7, 17).
; PLAN: r0=146(x), r1=127(y), r2=73(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=55(x1), r1=195(y1), r2=7(x2), r3=17(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a white circular shape at (146, 127) with radius 73.
; PLAN: r0=146(x), r1=127(y), r2=73(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 127
LDI r2, 73
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a cyan line between points (55, 195) and (7, 17).
; PLAN: r0=55(x1), r1=195(y1), r2=7(x2), r3=17(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 195
LDI r2, 7
LDI r3, 17
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
