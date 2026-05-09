; DESCRIPTION: Draws a cyan line from (246, 53) to (354, 41).
; PLAN: r0=246(x1), r1=53(y1), r2=354(x2), r3=41(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 53
LDI r2, 354
LDI r3, 41
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
