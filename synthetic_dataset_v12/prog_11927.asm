; DESCRIPTION: Draws a cyan line from (328, 48) to (140, 208).
; PLAN: r0=328(x1), r1=48(y1), r2=140(x2), r3=208(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 48
LDI r2, 140
LDI r3, 208
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
