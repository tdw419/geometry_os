; DESCRIPTION: Composite: . Then Draws a cyan rectangle at (21, 211) with width 93 and height 12. Then Places a cyan circle of radius 61 at center (105, 102).
; PLAN: r0=21(x), r1=211(y), r2=93(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=105(x), r1=102(y), r2=61(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a cyan rectangle at (21, 211) with width 93 and height 12.
; PLAN: r0=21(x), r1=211(y), r2=93(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 211
LDI r2, 93
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan circle of radius 61 at center (105, 102).
; PLAN: r0=105(x), r1=102(y), r2=61(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 105
LDI r1, 102
LDI r2, 61
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
