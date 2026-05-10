; DESCRIPTION: Draws a cyan line from (450, 12) to (165, 124).
; PLAN: r0=450(x1), r1=12(y1), r2=165(x2), r3=124(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 12
LDI r2, 165
LDI r3, 124
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
