; DESCRIPTION: Composite: . Then Renders a magenta line between points (133, 143) and (241, 4). Then Creates a blue rectangular region at (182, 130) spanning 52 by 103 pixels.
; PLAN: r0=133(x1), r1=143(y1), r2=241(x2), r3=4(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=182(x), r1=130(y), r2=52(width), r3=103(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a magenta line between points (133, 143) and (241, 4).
; PLAN: r0=133(x1), r1=143(y1), r2=241(x2), r3=4(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 143
LDI r2, 241
LDI r3, 4
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a blue rectangular region at (182, 130) spanning 52 by 103 pixels.
; PLAN: r0=182(x), r1=130(y), r2=52(width), r3=103(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 130
LDI r2, 52
LDI r3, 103
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
