; DESCRIPTION: Composite: . Then Draws a white rectangle at (104, 106) with width 67 and height 16. Then Renders a cyan line between points (181, 130) and (5, 160).
; PLAN: r0=104(x), r1=106(y), r2=67(width), r3=16(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=181(x1), r1=130(y1), r2=5(x2), r3=160(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a white rectangle at (104, 106) with width 67 and height 16.
; PLAN: r0=104(x), r1=106(y), r2=67(width), r3=16(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 106
LDI r2, 67
LDI r3, 16
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a cyan line between points (181, 130) and (5, 160).
; PLAN: r0=181(x1), r1=130(y1), r2=5(x2), r3=160(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 130
LDI r2, 5
LDI r3, 160
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
