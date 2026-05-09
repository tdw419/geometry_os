; DESCRIPTION: Draws a cyan line from (154, 54) to (489, 187).
; PLAN: r0=154(x1), r1=54(y1), r2=489(x2), r3=187(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 54
LDI r2, 489
LDI r3, 187
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
