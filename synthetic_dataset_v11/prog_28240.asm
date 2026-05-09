; DESCRIPTION: Draws a cyan line from (213, 103) to (3, 37).
; PLAN: r0=213(x1), r1=103(y1), r2=3(x2), r3=37(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 103
LDI r2, 3
LDI r3, 37
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
