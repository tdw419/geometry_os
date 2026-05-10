; DESCRIPTION: Renders a magenta line between points (410, 66) and (284, 138).
; PLAN: r0=410(x1), r1=66(y1), r2=284(x2), r3=138(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 66
LDI r2, 284
LDI r3, 138
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
