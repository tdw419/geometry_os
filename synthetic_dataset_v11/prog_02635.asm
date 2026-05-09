; DESCRIPTION: Composite: . Then Places a green 45x61 rectangle at position (49, 169). Then Renders a cyan disk with center (34, 201) and radius 12.
; PLAN: r0=49(x), r1=169(y), r2=45(width), r3=61(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=34(x), r1=201(y), r2=12(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a green 45x61 rectangle at position (49, 169).
; PLAN: r0=49(x), r1=169(y), r2=45(width), r3=61(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 169
LDI r2, 45
LDI r3, 61
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a cyan disk with center (34, 201) and radius 12.
; PLAN: r0=34(x), r1=201(y), r2=12(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 34
LDI r1, 201
LDI r2, 12
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
