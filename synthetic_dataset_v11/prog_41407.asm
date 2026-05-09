; DESCRIPTION: Composite: . Then Draws a orange line from (239, 52) to (171, 38). Then Sets a single black pixel at (104, 242).
; PLAN: r0=239(x1), r1=52(y1), r2=171(x2), r3=38(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=104(x), r1=242(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a orange line from (239, 52) to (171, 38).
; PLAN: r0=239(x1), r1=52(y1), r2=171(x2), r3=38(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 52
LDI r2, 171
LDI r3, 38
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single black pixel at (104, 242).
; PLAN: r0=104(x), r1=242(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 104
LDI r1, 242
LDI r2, 0x000000
PSET r0, r1, r2
HALT
