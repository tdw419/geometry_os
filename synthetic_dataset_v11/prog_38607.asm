; DESCRIPTION: Draws a cyan line from (83, 202) to (117, 103).
; PLAN: r0=83(x1), r1=202(y1), r2=117(x2), r3=103(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 202
LDI r2, 117
LDI r3, 103
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
