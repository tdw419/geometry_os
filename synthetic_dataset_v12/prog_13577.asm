; DESCRIPTION: Draws a green line from (510, 154) to (429, 54).
; PLAN: r0=510(x1), r1=154(y1), r2=429(x2), r3=54(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 154
LDI r2, 429
LDI r3, 54
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
