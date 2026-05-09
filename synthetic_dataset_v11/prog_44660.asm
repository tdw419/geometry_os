; DESCRIPTION: Composite: . Then Draws a magenta line from (247, 204) to (71, 214). Then Renders a black box of size 35x116 starting at (20, 44).
; PLAN: r0=247(x1), r1=204(y1), r2=71(x2), r3=214(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=20(x), r1=44(y), r2=35(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a magenta line from (247, 204) to (71, 214).
; PLAN: r0=247(x1), r1=204(y1), r2=71(x2), r3=214(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 204
LDI r2, 71
LDI r3, 214
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a black box of size 35x116 starting at (20, 44).
; PLAN: r0=20(x), r1=44(y), r2=35(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 44
LDI r2, 35
LDI r3, 116
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
