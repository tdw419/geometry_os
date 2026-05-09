; DESCRIPTION: Draws a cyan line from (228, 83) to (102, 198).
; PLAN: r0=228(x1), r1=83(y1), r2=102(x2), r3=198(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 83
LDI r2, 102
LDI r3, 198
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
