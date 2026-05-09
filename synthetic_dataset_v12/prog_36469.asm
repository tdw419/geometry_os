; DESCRIPTION: Draws a cyan line from (383, 114) to (334, 103).
; PLAN: r0=383(x1), r1=114(y1), r2=334(x2), r3=103(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 114
LDI r2, 334
LDI r3, 103
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
