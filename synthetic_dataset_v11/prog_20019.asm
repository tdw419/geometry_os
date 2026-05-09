; DESCRIPTION: Draws a cyan line from (37, 186) to (226, 16).
; PLAN: r0=37(x1), r1=186(y1), r2=226(x2), r3=16(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 186
LDI r2, 226
LDI r3, 16
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
