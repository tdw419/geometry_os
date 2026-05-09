; DESCRIPTION: Draws a cyan line from (295, 167) to (27, 130).
; PLAN: r0=295(x1), r1=167(y1), r2=27(x2), r3=130(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 167
LDI r2, 27
LDI r3, 130
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
