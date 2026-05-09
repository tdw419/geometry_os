; DESCRIPTION: Draws a cyan line from (375, 220) to (196, 172).
; PLAN: r0=375(x1), r1=220(y1), r2=196(x2), r3=172(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 220
LDI r2, 196
LDI r3, 172
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
