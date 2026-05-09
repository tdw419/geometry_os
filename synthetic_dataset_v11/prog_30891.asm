; DESCRIPTION: Draws a white line from (208, 27) to (117, 117).
; PLAN: r0=208(x1), r1=27(y1), r2=117(x2), r3=117(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 27
LDI r2, 117
LDI r3, 117
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
