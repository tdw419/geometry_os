; DESCRIPTION: Composite: . Then Renders a magenta disk with center (225, 229) and radius 22. Then Places a orange 15x79 rectangle at position (104, 104).
; PLAN: r0=225(x), r1=229(y), r2=22(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=104(x), r1=104(y), r2=15(width), r3=79(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a magenta disk with center (225, 229) and radius 22.
; PLAN: r0=225(x), r1=229(y), r2=22(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 225
LDI r1, 229
LDI r2, 22
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a orange 15x79 rectangle at position (104, 104).
; PLAN: r0=104(x), r1=104(y), r2=15(width), r3=79(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 104
LDI r2, 15
LDI r3, 79
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
