; DESCRIPTION: Composite: . Then Renders a yellow box of size 92x19 starting at (146, 75). Then Renders a orange disk with center (147, 91) and radius 76.
; PLAN: r0=146(x), r1=75(y), r2=92(width), r3=19(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=147(x), r1=91(y), r2=76(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a yellow box of size 92x19 starting at (146, 75).
; PLAN: r0=146(x), r1=75(y), r2=92(width), r3=19(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 75
LDI r2, 92
LDI r3, 19
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a orange disk with center (147, 91) and radius 76.
; PLAN: r0=147(x), r1=91(y), r2=76(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 147
LDI r1, 91
LDI r2, 76
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
