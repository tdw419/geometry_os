; DESCRIPTION: Draws a cyan line from (208, 8) to (143, 196).
; PLAN: r0=208(x1), r1=8(y1), r2=143(x2), r3=196(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 8
LDI r2, 143
LDI r3, 196
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
