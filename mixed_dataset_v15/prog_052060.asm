; DESCRIPTION: Draws a cyan line from (221, 27) to (497, 187).
; PLAN: r0=221(x1), r1=27(y1), r2=497(x2), r3=187(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 27
LDI r2, 497
LDI r3, 187
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
