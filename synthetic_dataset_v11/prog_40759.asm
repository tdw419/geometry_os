; DESCRIPTION: Composite: . Then Sets a single cyan pixel at (227, 4). Then Draws a red line from (248, 137) to (214, 46).
; PLAN: r0=227(x), r1=4(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=248(x1), r1=137(y1), r2=214(x2), r3=46(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single cyan pixel at (227, 4).
; PLAN: r0=227(x), r1=4(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 227
LDI r1, 4
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Draws a red line from (248, 137) to (214, 46).
; PLAN: r0=248(x1), r1=137(y1), r2=214(x2), r3=46(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 137
LDI r2, 214
LDI r3, 46
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
