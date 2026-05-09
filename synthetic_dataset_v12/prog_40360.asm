; DESCRIPTION: Draws a cyan line from (324, 159) to (228, 200).
; PLAN: r0=324(x1), r1=159(y1), r2=228(x2), r3=200(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 159
LDI r2, 228
LDI r3, 200
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
