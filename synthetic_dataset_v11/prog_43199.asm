; DESCRIPTION: Draws a cyan line from (193, 39) to (156, 7).
; PLAN: r0=193(x1), r1=39(y1), r2=156(x2), r3=7(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 39
LDI r2, 156
LDI r3, 7
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
