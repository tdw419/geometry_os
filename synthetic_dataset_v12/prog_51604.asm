; DESCRIPTION: Composite: Creates a green circular shape at (289, 100) with radius 79 then Renders a magenta line between points (456, 85) and (467, 146).
; PLAN: r0=289(x), r1=100(y), r2=79(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=456(x1), r6=85(y1), r7=467(x2), r8=146(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 289
LDI r1, 100
LDI r2, 79
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 456
LDI r6, 85
LDI r7, 467
LDI r8, 146
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
