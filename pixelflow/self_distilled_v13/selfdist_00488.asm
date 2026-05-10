; DESCRIPTION: Draws a magenta line from (228, 39) to (152, 178).
; PLAN: r0=228(x1), r1=39(y1), r2=152(x2), r3=178(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 39
LDI r2, 152
LDI r3, 178
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
