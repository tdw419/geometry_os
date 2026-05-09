; DESCRIPTION: Draws a cyan line from (205, 31) to (452, 27).
; PLAN: r0=205(x1), r1=31(y1), r2=452(x2), r3=27(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 31
LDI r2, 452
LDI r3, 27
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
