; DESCRIPTION: Draws a cyan line from (60, 6) to (344, 27).
; PLAN: r0=60(x1), r1=6(y1), r2=344(x2), r3=27(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 6
LDI r2, 344
LDI r3, 27
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
