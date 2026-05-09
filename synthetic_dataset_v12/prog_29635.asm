; DESCRIPTION: Draws a cyan line from (154, 5) to (414, 187).
; PLAN: r0=154(x1), r1=5(y1), r2=414(x2), r3=187(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 5
LDI r2, 414
LDI r3, 187
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
