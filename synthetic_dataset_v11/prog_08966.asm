; DESCRIPTION: Draws a cyan line from (150, 51) to (64, 28).
; PLAN: r0=150(x1), r1=51(y1), r2=64(x2), r3=28(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 51
LDI r2, 64
LDI r3, 28
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
