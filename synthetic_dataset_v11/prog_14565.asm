; DESCRIPTION: Composite: . Then Renders a magenta line between points (51, 51) and (15, 144). Then Creates a white rectangular region at (18, 157) spanning 82 by 44 pixels.
; PLAN: r0=51(x1), r1=51(y1), r2=15(x2), r3=144(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=18(x), r1=157(y), r2=82(width), r3=44(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a magenta line between points (51, 51) and (15, 144).
; PLAN: r0=51(x1), r1=51(y1), r2=15(x2), r3=144(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 51
LDI r2, 15
LDI r3, 144
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a white rectangular region at (18, 157) spanning 82 by 44 pixels.
; PLAN: r0=18(x), r1=157(y), r2=82(width), r3=44(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 157
LDI r2, 82
LDI r3, 44
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
