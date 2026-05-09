; DESCRIPTION: Draws a cyan line from (90, 253) to (55, 24).
; PLAN: r0=90(x1), r1=253(y1), r2=55(x2), r3=24(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 253
LDI r2, 55
LDI r3, 24
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
