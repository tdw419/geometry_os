; DESCRIPTION: Draws a cyan line from (146, 233) to (75, 91).
; PLAN: r0=146(x1), r1=233(y1), r2=75(x2), r3=91(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 233
LDI r2, 75
LDI r3, 91
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
