; DESCRIPTION: Composite: . Then Renders a red line between points (143, 128) and (252, 197). Then Creates a red circular shape at (106, 229) with radius 12.
; PLAN: r0=143(x1), r1=128(y1), r2=252(x2), r3=197(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=106(x), r1=229(y), r2=12(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a red line between points (143, 128) and (252, 197).
; PLAN: r0=143(x1), r1=128(y1), r2=252(x2), r3=197(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 128
LDI r2, 252
LDI r3, 197
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a red circular shape at (106, 229) with radius 12.
; PLAN: r0=106(x), r1=229(y), r2=12(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 106
LDI r1, 229
LDI r2, 12
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
