; DESCRIPTION: Composite: . Then Renders a orange disk with center (163, 75) and radius 48. Then Renders a cyan line between points (236, 157) and (231, 235).
; PLAN: r0=163(x), r1=75(y), r2=48(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=236(x1), r1=157(y1), r2=231(x2), r3=235(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a orange disk with center (163, 75) and radius 48.
; PLAN: r0=163(x), r1=75(y), r2=48(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 163
LDI r1, 75
LDI r2, 48
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a cyan line between points (236, 157) and (231, 235).
; PLAN: r0=236(x1), r1=157(y1), r2=231(x2), r3=235(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 157
LDI r2, 231
LDI r3, 235
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
