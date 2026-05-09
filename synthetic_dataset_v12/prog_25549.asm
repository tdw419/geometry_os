; DESCRIPTION: Draws a cyan line from (504, 41) to (314, 228).
; PLAN: r0=504(x1), r1=41(y1), r2=314(x2), r3=228(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 41
LDI r2, 314
LDI r3, 228
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
