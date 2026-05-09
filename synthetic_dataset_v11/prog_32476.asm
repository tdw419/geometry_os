; DESCRIPTION: Draws a cyan line from (30, 177) to (134, 113).
; PLAN: r0=30(x1), r1=177(y1), r2=134(x2), r3=113(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 177
LDI r2, 134
LDI r3, 113
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
