; DESCRIPTION: Composite: . Then Creates a black circular shape at (174, 163) with radius 33. Then Renders a cyan line between points (160, 42) and (49, 80).
; PLAN: r0=174(x), r1=163(y), r2=33(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=160(x1), r1=42(y1), r2=49(x2), r3=80(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a black circular shape at (174, 163) with radius 33.
; PLAN: r0=174(x), r1=163(y), r2=33(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 174
LDI r1, 163
LDI r2, 33
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a cyan line between points (160, 42) and (49, 80).
; PLAN: r0=160(x1), r1=42(y1), r2=49(x2), r3=80(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 42
LDI r2, 49
LDI r3, 80
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
