; DESCRIPTION: Renders a magenta line between points (420, 57) and (354, 107).
; PLAN: r0=420(x1), r1=57(y1), r2=354(x2), r3=107(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 57
LDI r2, 354
LDI r3, 107
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
