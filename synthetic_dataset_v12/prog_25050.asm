; DESCRIPTION: Draws a cyan line from (75, 120) to (319, 186).
; PLAN: r0=75(x1), r1=120(y1), r2=319(x2), r3=186(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 120
LDI r2, 319
LDI r3, 186
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
