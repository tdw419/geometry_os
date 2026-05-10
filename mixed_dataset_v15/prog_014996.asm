; DESCRIPTION: Draws a purple line from (284, 146) to (176, 246).
; PLAN: r0=284(x1), r1=146(y1), r2=176(x2), r3=246(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 146
LDI r2, 176
LDI r3, 246
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
