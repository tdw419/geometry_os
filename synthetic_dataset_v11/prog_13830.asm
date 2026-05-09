; DESCRIPTION: Draws a cyan line from (8, 109) to (220, 143).
; PLAN: r0=8(x1), r1=109(y1), r2=220(x2), r3=143(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 109
LDI r2, 220
LDI r3, 143
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
