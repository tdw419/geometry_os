; DESCRIPTION: Composite: . Then Creates a cyan circular shape at (156, 43) with radius 28. Then Renders a white line between points (13, 235) and (229, 143).
; PLAN: r0=156(x), r1=43(y), r2=28(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=13(x1), r1=235(y1), r2=229(x2), r3=143(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a cyan circular shape at (156, 43) with radius 28.
; PLAN: r0=156(x), r1=43(y), r2=28(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 156
LDI r1, 43
LDI r2, 28
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a white line between points (13, 235) and (229, 143).
; PLAN: r0=13(x1), r1=235(y1), r2=229(x2), r3=143(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 235
LDI r2, 229
LDI r3, 143
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
