; DESCRIPTION: Composite: . Then Renders a green box of size 72x47 starting at (120, 34). Then Places a green circle of radius 40 at center (129, 45).
; PLAN: r0=120(x), r1=34(y), r2=72(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=129(x), r1=45(y), r2=40(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a green box of size 72x47 starting at (120, 34).
; PLAN: r0=120(x), r1=34(y), r2=72(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 34
LDI r2, 72
LDI r3, 47
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a green circle of radius 40 at center (129, 45).
; PLAN: r0=129(x), r1=45(y), r2=40(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 129
LDI r1, 45
LDI r2, 40
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
