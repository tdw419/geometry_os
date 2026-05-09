; DESCRIPTION: Composite: . Then Renders a cyan line between points (107, 87) and (67, 75). Then Renders a cyan disk with center (127, 95) and radius 47.
; PLAN: r0=107(x1), r1=87(y1), r2=67(x2), r3=75(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=127(x), r1=95(y), r2=47(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a cyan line between points (107, 87) and (67, 75).
; PLAN: r0=107(x1), r1=87(y1), r2=67(x2), r3=75(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 87
LDI r2, 67
LDI r3, 75
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a cyan disk with center (127, 95) and radius 47.
; PLAN: r0=127(x), r1=95(y), r2=47(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 127
LDI r1, 95
LDI r2, 47
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
