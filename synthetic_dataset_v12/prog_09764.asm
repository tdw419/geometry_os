; DESCRIPTION: Draws a cyan line from (249, 90) to (391, 113).
; PLAN: r0=249(x1), r1=90(y1), r2=391(x2), r3=113(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 90
LDI r2, 391
LDI r3, 113
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
