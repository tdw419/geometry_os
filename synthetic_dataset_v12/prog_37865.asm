; DESCRIPTION: Renders a cyan line between points (428, 53) and (316, 213).
; PLAN: r0=428(x1), r1=53(y1), r2=316(x2), r3=213(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 53
LDI r2, 316
LDI r3, 213
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
