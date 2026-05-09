; DESCRIPTION: Composite: . Then Renders a white box of size 14x82 starting at (225, 96). Then Places a cyan circle of radius 14 at center (52, 90).
; PLAN: r0=225(x), r1=96(y), r2=14(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=52(x), r1=90(y), r2=14(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a white box of size 14x82 starting at (225, 96).
; PLAN: r0=225(x), r1=96(y), r2=14(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 96
LDI r2, 14
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan circle of radius 14 at center (52, 90).
; PLAN: r0=52(x), r1=90(y), r2=14(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 52
LDI r1, 90
LDI r2, 14
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
