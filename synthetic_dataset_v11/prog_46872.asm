; DESCRIPTION: Composite: . Then Draws a cyan line from (239, 95) to (51, 132). Then Places a orange dot at position (67, 41).
; PLAN: r0=239(x1), r1=95(y1), r2=51(x2), r3=132(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=67(x), r1=41(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a cyan line from (239, 95) to (51, 132).
; PLAN: r0=239(x1), r1=95(y1), r2=51(x2), r3=132(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 95
LDI r2, 51
LDI r3, 132
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange dot at position (67, 41).
; PLAN: r0=67(x), r1=41(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 67
LDI r1, 41
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
