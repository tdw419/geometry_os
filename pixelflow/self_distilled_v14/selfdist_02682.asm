; DESCRIPTION: Draws a white line from (292, 144) to (307, 29).
; PLAN: r0=292(x1), r1=144(y1), r2=307(x2), r3=29(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 144
LDI r2, 307
LDI r3, 29
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
