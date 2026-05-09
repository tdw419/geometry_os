; DESCRIPTION: Draws a magenta line from (39, 228) to (459, 173).
; PLAN: r0=39(x1), r1=228(y1), r2=459(x2), r3=173(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 228
LDI r2, 459
LDI r3, 173
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
