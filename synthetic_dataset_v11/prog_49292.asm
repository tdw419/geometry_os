; DESCRIPTION: Composite: . Then Draws a white rectangle at (138, 104) with width 57 and height 26. Then Renders a cyan disk with center (187, 75) and radius 67.
; PLAN: r0=138(x), r1=104(y), r2=57(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=187(x), r1=75(y), r2=67(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a white rectangle at (138, 104) with width 57 and height 26.
; PLAN: r0=138(x), r1=104(y), r2=57(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 104
LDI r2, 57
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a cyan disk with center (187, 75) and radius 67.
; PLAN: r0=187(x), r1=75(y), r2=67(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 75
LDI r2, 67
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
