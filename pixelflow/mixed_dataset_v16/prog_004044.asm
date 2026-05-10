; DESCRIPTION: Draws a cyan line from (52, 68) to (86, 21).
; PLAN: r0=52(x1), r1=68(y1), r2=86(x2), r3=21(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 68
LDI r2, 86
LDI r3, 21
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
