; DESCRIPTION: Renders a cyan line between points (90, 165) and (362, 208).
; PLAN: r0=90(x1), r1=165(y1), r2=362(x2), r3=208(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 165
LDI r2, 362
LDI r3, 208
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
