; DESCRIPTION: Draws a cyan line from (77, 45) to (246, 113).
; PLAN: r0=77(x1), r1=45(y1), r2=246(x2), r3=113(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 45
LDI r2, 246
LDI r3, 113
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
