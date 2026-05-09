; DESCRIPTION: Draws a cyan line from (187, 205) to (27, 169).
; PLAN: r0=187(x1), r1=205(y1), r2=27(x2), r3=169(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 205
LDI r2, 27
LDI r3, 169
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
