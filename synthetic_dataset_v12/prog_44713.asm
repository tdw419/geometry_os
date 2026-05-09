; DESCRIPTION: Draws a cyan line from (145, 253) to (292, 27).
; PLAN: r0=145(x1), r1=253(y1), r2=292(x2), r3=27(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 253
LDI r2, 292
LDI r3, 27
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
