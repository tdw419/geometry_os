; DESCRIPTION: Draws a magenta line from (299, 146) to (294, 202).
; PLAN: r0=299(x1), r1=146(y1), r2=294(x2), r3=202(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 146
LDI r2, 294
LDI r3, 202
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
