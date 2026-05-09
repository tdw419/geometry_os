; DESCRIPTION: Composite: . Then Places a white circle of radius 50 at center (192, 118). Then Renders a yellow line between points (249, 173) and (27, 70).
; PLAN: r0=192(x), r1=118(y), r2=50(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=249(x1), r1=173(y1), r2=27(x2), r3=70(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white circle of radius 50 at center (192, 118).
; PLAN: r0=192(x), r1=118(y), r2=50(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 192
LDI r1, 118
LDI r2, 50
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a yellow line between points (249, 173) and (27, 70).
; PLAN: r0=249(x1), r1=173(y1), r2=27(x2), r3=70(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 173
LDI r2, 27
LDI r3, 70
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
