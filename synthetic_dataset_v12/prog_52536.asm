; DESCRIPTION: Renders a white line between points (352, 37) and (292, 61).
; PLAN: r0=352(x1), r1=37(y1), r2=292(x2), r3=61(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 37
LDI r2, 292
LDI r3, 61
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
