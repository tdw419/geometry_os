; DESCRIPTION: Places a magenta line segment connecting (107, 228) to (465, 107).
; PLAN: r0=107(x1), r1=228(y1), r2=465(x2), r3=107(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 228
LDI r2, 465
LDI r3, 107
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
