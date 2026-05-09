; DESCRIPTION: Draws a cyan line from (27, 103) to (448, 210).
; PLAN: r0=27(x1), r1=103(y1), r2=448(x2), r3=210(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 103
LDI r2, 448
LDI r3, 210
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
