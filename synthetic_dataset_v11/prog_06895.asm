; DESCRIPTION: Composite: . Then Draws a red rectangle at (21, 10) with width 104 and height 78. Then Places a green line segment connecting (83, 106) to (48, 107).
; PLAN: r0=21(x), r1=10(y), r2=104(width), r3=78(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=83(x1), r1=106(y1), r2=48(x2), r3=107(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a red rectangle at (21, 10) with width 104 and height 78.
; PLAN: r0=21(x), r1=10(y), r2=104(width), r3=78(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 10
LDI r2, 104
LDI r3, 78
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a green line segment connecting (83, 106) to (48, 107).
; PLAN: r0=83(x1), r1=106(y1), r2=48(x2), r3=107(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 106
LDI r2, 48
LDI r3, 107
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
