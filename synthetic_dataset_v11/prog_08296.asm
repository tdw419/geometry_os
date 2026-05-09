; DESCRIPTION: Draws a cyan line from (129, 120) to (146, 160).
; PLAN: r0=129(x1), r1=120(y1), r2=146(x2), r3=160(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 120
LDI r2, 146
LDI r3, 160
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
