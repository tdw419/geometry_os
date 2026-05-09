; DESCRIPTION: Composite: . Then Renders a magenta box of size 82x37 starting at (83, 144). Then Places a white circle of radius 40 at center (41, 104).
; PLAN: r0=83(x), r1=144(y), r2=82(width), r3=37(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=41(x), r1=104(y), r2=40(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a magenta box of size 82x37 starting at (83, 144).
; PLAN: r0=83(x), r1=144(y), r2=82(width), r3=37(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 144
LDI r2, 82
LDI r3, 37
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a white circle of radius 40 at center (41, 104).
; PLAN: r0=41(x), r1=104(y), r2=40(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 41
LDI r1, 104
LDI r2, 40
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
