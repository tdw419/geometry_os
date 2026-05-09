; DESCRIPTION: Composite: . Then Renders a green line between points (147, 126) and (127, 218). Then Creates a blue rectangular region at (131, 124) spanning 85 by 27 pixels.
; PLAN: r0=147(x1), r1=126(y1), r2=127(x2), r3=218(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=131(x), r1=124(y), r2=85(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a green line between points (147, 126) and (127, 218).
; PLAN: r0=147(x1), r1=126(y1), r2=127(x2), r3=218(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 126
LDI r2, 127
LDI r3, 218
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a blue rectangular region at (131, 124) spanning 85 by 27 pixels.
; PLAN: r0=131(x), r1=124(y), r2=85(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 124
LDI r2, 85
LDI r3, 27
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
