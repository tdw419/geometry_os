; DESCRIPTION: Draws a cyan line from (149, 144) to (228, 17).
; PLAN: r0=149(x1), r1=144(y1), r2=228(x2), r3=17(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 144
LDI r2, 228
LDI r3, 17
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
