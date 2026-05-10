; DESCRIPTION: Draws a cyan line from (154, 83) to (156, 200).
; PLAN: r0=154(x1), r1=83(y1), r2=156(x2), r3=200(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 83
LDI r2, 156
LDI r3, 200
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
