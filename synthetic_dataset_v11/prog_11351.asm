; DESCRIPTION: Composite: . Then Sets a single green pixel at (58, 47). Then Draws a white rectangle at (101, 96) with width 32 and height 107.
; PLAN: r0=58(x), r1=47(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=101(x), r1=96(y), r2=32(width), r3=107(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single green pixel at (58, 47).
; PLAN: r0=58(x), r1=47(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 58
LDI r1, 47
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Draws a white rectangle at (101, 96) with width 32 and height 107.
; PLAN: r0=101(x), r1=96(y), r2=32(width), r3=107(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 96
LDI r2, 32
LDI r3, 107
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
