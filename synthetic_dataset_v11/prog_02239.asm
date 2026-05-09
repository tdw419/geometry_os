; DESCRIPTION: Composite: . Then Places a cyan circle of radius 52 at center (110, 119). Then Draws a red rectangle at (131, 146) with width 55 and height 39.
; PLAN: r0=110(x), r1=119(y), r2=52(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=131(x), r1=146(y), r2=55(width), r3=39(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan circle of radius 52 at center (110, 119).
; PLAN: r0=110(x), r1=119(y), r2=52(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 110
LDI r1, 119
LDI r2, 52
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a red rectangle at (131, 146) with width 55 and height 39.
; PLAN: r0=131(x), r1=146(y), r2=55(width), r3=39(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 146
LDI r2, 55
LDI r3, 39
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
