; DESCRIPTION: Composite: . Then Renders a black disk with center (125, 191) and radius 63. Then Renders a magenta line between points (209, 152) and (154, 186).
; PLAN: r0=125(x), r1=191(y), r2=63(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=209(x1), r1=152(y1), r2=154(x2), r3=186(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a black disk with center (125, 191) and radius 63.
; PLAN: r0=125(x), r1=191(y), r2=63(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 125
LDI r1, 191
LDI r2, 63
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a magenta line between points (209, 152) and (154, 186).
; PLAN: r0=209(x1), r1=152(y1), r2=154(x2), r3=186(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 152
LDI r2, 154
LDI r3, 186
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
