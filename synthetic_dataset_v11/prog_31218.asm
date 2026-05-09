; DESCRIPTION: Draws a magenta line from (27, 228) to (146, 64).
; PLAN: r0=27(x1), r1=228(y1), r2=146(x2), r3=64(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 228
LDI r2, 146
LDI r3, 64
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
