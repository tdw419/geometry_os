; DESCRIPTION: Draws a yellow line from (154, 205) to (429, 150).
; PLAN: r0=154(x1), r1=205(y1), r2=429(x2), r3=150(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 205
LDI r2, 429
LDI r3, 150
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
