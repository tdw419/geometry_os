; DESCRIPTION: Composite: . Then Renders a white disk with center (175, 98) and radius 58. Then Places a cyan line segment connecting (146, 21) to (96, 188).
; PLAN: r0=175(x), r1=98(y), r2=58(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=146(x1), r1=21(y1), r2=96(x2), r3=188(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a white disk with center (175, 98) and radius 58.
; PLAN: r0=175(x), r1=98(y), r2=58(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 175
LDI r1, 98
LDI r2, 58
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a cyan line segment connecting (146, 21) to (96, 188).
; PLAN: r0=146(x1), r1=21(y1), r2=96(x2), r3=188(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 21
LDI r2, 96
LDI r3, 188
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
