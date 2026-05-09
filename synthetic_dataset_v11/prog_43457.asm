; DESCRIPTION: Composite: . Then Sets a single cyan pixel at (55, 202). Then Draws a yellow rectangle at (28, 54) with width 29 and height 16.
; PLAN: r0=55(x), r1=202(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=28(x), r1=54(y), r2=29(width), r3=16(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single cyan pixel at (55, 202).
; PLAN: r0=55(x), r1=202(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 55
LDI r1, 202
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Draws a yellow rectangle at (28, 54) with width 29 and height 16.
; PLAN: r0=28(x), r1=54(y), r2=29(width), r3=16(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 54
LDI r2, 29
LDI r3, 16
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
