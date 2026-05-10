; DESCRIPTION: Draws a cyan line from (2, 99) to (394, 167).
; PLAN: r0=2(x1), r1=99(y1), r2=394(x2), r3=167(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 99
LDI r2, 394
LDI r3, 167
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
