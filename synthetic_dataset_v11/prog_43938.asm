; DESCRIPTION: Composite: . Then Renders a green line between points (224, 104) and (136, 145). Then Creates a cyan rectangular region at (147, 196) spanning 37 by 52 pixels.
; PLAN: r0=224(x1), r1=104(y1), r2=136(x2), r3=145(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=147(x), r1=196(y), r2=37(width), r3=52(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a green line between points (224, 104) and (136, 145).
; PLAN: r0=224(x1), r1=104(y1), r2=136(x2), r3=145(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 104
LDI r2, 136
LDI r3, 145
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a cyan rectangular region at (147, 196) spanning 37 by 52 pixels.
; PLAN: r0=147(x), r1=196(y), r2=37(width), r3=52(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 196
LDI r2, 37
LDI r3, 52
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
