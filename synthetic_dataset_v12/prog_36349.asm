; DESCRIPTION: Renders a magenta line between points (16, 73) and (482, 241).
; PLAN: r0=16(x1), r1=73(y1), r2=482(x2), r3=241(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 73
LDI r2, 482
LDI r3, 241
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
