; DESCRIPTION: Composite: . Then Renders a green disk with center (176, 129) and radius 39. Then Renders a black line between points (123, 44) and (167, 252).
; PLAN: r0=176(x), r1=129(y), r2=39(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=123(x1), r1=44(y1), r2=167(x2), r3=252(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a green disk with center (176, 129) and radius 39.
; PLAN: r0=176(x), r1=129(y), r2=39(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 129
LDI r2, 39
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a black line between points (123, 44) and (167, 252).
; PLAN: r0=123(x1), r1=44(y1), r2=167(x2), r3=252(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 44
LDI r2, 167
LDI r3, 252
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
