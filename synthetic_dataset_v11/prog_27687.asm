; DESCRIPTION: Composite: . Then Draws a green line from (6, 164) to (3, 91). Then Sets a single cyan pixel at (51, 215).
; PLAN: r0=6(x1), r1=164(y1), r2=3(x2), r3=91(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=51(x), r1=215(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a green line from (6, 164) to (3, 91).
; PLAN: r0=6(x1), r1=164(y1), r2=3(x2), r3=91(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 164
LDI r2, 3
LDI r3, 91
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single cyan pixel at (51, 215).
; PLAN: r0=51(x), r1=215(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 51
LDI r1, 215
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
