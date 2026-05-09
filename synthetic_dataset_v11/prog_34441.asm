; DESCRIPTION: Composite: . Then Renders a green disk with center (73, 69) and radius 36. Then Renders a cyan line between points (24, 210) and (255, 98).
; PLAN: r0=73(x), r1=69(y), r2=36(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=24(x1), r1=210(y1), r2=255(x2), r3=98(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a green disk with center (73, 69) and radius 36.
; PLAN: r0=73(x), r1=69(y), r2=36(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 73
LDI r1, 69
LDI r2, 36
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a cyan line between points (24, 210) and (255, 98).
; PLAN: r0=24(x1), r1=210(y1), r2=255(x2), r3=98(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 210
LDI r2, 255
LDI r3, 98
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
