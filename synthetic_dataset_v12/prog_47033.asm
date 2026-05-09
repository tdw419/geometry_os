; DESCRIPTION: Draws a cyan line from (167, 132) to (354, 60).
; PLAN: r0=167(x1), r1=132(y1), r2=354(x2), r3=60(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 132
LDI r2, 354
LDI r3, 60
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
