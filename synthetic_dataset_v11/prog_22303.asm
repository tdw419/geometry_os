; DESCRIPTION: Draws a magenta line from (228, 117) to (27, 107).
; PLAN: r0=228(x1), r1=117(y1), r2=27(x2), r3=107(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 117
LDI r2, 27
LDI r3, 107
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
