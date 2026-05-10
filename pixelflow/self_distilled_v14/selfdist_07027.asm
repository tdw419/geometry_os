; DESCRIPTION: Draws a cyan line from (105, 13) to (338, 125).
; PLAN: r0=105(x1), r1=13(y1), r2=338(x2), r3=125(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 13
LDI r2, 338
LDI r3, 125
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
