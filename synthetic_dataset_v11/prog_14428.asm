; DESCRIPTION: Composite: . Then Creates a green circular shape at (45, 60) with radius 40. Then Renders a green box of size 82x17 starting at (164, 137).
; PLAN: r0=45(x), r1=60(y), r2=40(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=164(x), r1=137(y), r2=82(width), r3=17(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a green circular shape at (45, 60) with radius 40.
; PLAN: r0=45(x), r1=60(y), r2=40(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 45
LDI r1, 60
LDI r2, 40
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a green box of size 82x17 starting at (164, 137).
; PLAN: r0=164(x), r1=137(y), r2=82(width), r3=17(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 137
LDI r2, 82
LDI r3, 17
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
