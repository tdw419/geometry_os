; DESCRIPTION: Draws a cyan line from (83, 138) to (329, 50).
; PLAN: r0=83(x1), r1=138(y1), r2=329(x2), r3=50(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 138
LDI r2, 329
LDI r3, 50
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
