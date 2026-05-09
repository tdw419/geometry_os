; DESCRIPTION: Composite: . Then Creates a orange circular shape at (186, 82) with radius 70. Then Renders a green line between points (242, 145) and (247, 41).
; PLAN: r0=186(x), r1=82(y), r2=70(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=242(x1), r1=145(y1), r2=247(x2), r3=41(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a orange circular shape at (186, 82) with radius 70.
; PLAN: r0=186(x), r1=82(y), r2=70(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 186
LDI r1, 82
LDI r2, 70
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a green line between points (242, 145) and (247, 41).
; PLAN: r0=242(x1), r1=145(y1), r2=247(x2), r3=41(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 145
LDI r2, 247
LDI r3, 41
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
