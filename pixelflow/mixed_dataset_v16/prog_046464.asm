; DESCRIPTION: Draws a cyan line from (170, 59) to (344, 126).
; PLAN: r0=170(x1), r1=59(y1), r2=344(x2), r3=126(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 59
LDI r2, 344
LDI r3, 126
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
