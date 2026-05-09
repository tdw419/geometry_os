; DESCRIPTION: Composite: . Then Creates a cyan circular shape at (96, 208) with radius 15. Then Renders a white line between points (51, 129) and (113, 4).
; PLAN: r0=96(x), r1=208(y), r2=15(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=51(x1), r1=129(y1), r2=113(x2), r3=4(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a cyan circular shape at (96, 208) with radius 15.
; PLAN: r0=96(x), r1=208(y), r2=15(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 96
LDI r1, 208
LDI r2, 15
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a white line between points (51, 129) and (113, 4).
; PLAN: r0=51(x1), r1=129(y1), r2=113(x2), r3=4(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 129
LDI r2, 113
LDI r3, 4
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
