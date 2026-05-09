; DESCRIPTION: Composite: . Then Creates a white rectangular region at (146, 189) spanning 40 by 30 pixels. Then Renders a magenta line between points (183, 178) and (40, 182).
; PLAN: r0=146(x), r1=189(y), r2=40(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=183(x1), r1=178(y1), r2=40(x2), r3=182(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a white rectangular region at (146, 189) spanning 40 by 30 pixels.
; PLAN: r0=146(x), r1=189(y), r2=40(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 189
LDI r2, 40
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a magenta line between points (183, 178) and (40, 182).
; PLAN: r0=183(x1), r1=178(y1), r2=40(x2), r3=182(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 178
LDI r2, 40
LDI r3, 182
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
