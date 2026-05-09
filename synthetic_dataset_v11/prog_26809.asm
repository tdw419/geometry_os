; DESCRIPTION: Composite: . Then Places a orange dot at position (3, 83). Then Draws a cyan line from (64, 198) to (245, 78).
; PLAN: r0=3(x), r1=83(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=64(x1), r1=198(y1), r2=245(x2), r3=78(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange dot at position (3, 83).
; PLAN: r0=3(x), r1=83(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 3
LDI r1, 83
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Draws a cyan line from (64, 198) to (245, 78).
; PLAN: r0=64(x1), r1=198(y1), r2=245(x2), r3=78(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 198
LDI r2, 245
LDI r3, 78
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
