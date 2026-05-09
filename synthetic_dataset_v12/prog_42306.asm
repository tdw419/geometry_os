; DESCRIPTION: Draws a magenta line from (67, 159) to (167, 253).
; PLAN: r0=67(x1), r1=159(y1), r2=167(x2), r3=253(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 159
LDI r2, 167
LDI r3, 253
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
