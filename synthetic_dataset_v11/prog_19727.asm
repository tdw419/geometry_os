; DESCRIPTION: Composite: . Then Places a cyan dot at position (236, 120). Then Draws a cyan line from (16, 164) to (219, 252).
; PLAN: r0=236(x), r1=120(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=16(x1), r1=164(y1), r2=219(x2), r3=252(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan dot at position (236, 120).
; PLAN: r0=236(x), r1=120(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 236
LDI r1, 120
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Draws a cyan line from (16, 164) to (219, 252).
; PLAN: r0=16(x1), r1=164(y1), r2=219(x2), r3=252(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 164
LDI r2, 219
LDI r3, 252
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
