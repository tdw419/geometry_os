; DESCRIPTION: Composite: . Then Renders a purple line between points (164, 215) and (164, 174). Then Renders a purple box of size 33x15 starting at (135, 162).
; PLAN: r0=164(x1), r1=215(y1), r2=164(x2), r3=174(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=135(x), r1=162(y), r2=33(width), r3=15(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a purple line between points (164, 215) and (164, 174).
; PLAN: r0=164(x1), r1=215(y1), r2=164(x2), r3=174(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 215
LDI r2, 164
LDI r3, 174
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a purple box of size 33x15 starting at (135, 162).
; PLAN: r0=135(x), r1=162(y), r2=33(width), r3=15(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 162
LDI r2, 33
LDI r3, 15
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
