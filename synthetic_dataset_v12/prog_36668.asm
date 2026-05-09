; DESCRIPTION: Draws a cyan line from (19, 183) to (21, 125).
; PLAN: r0=19(x1), r1=183(y1), r2=21(x2), r3=125(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 183
LDI r2, 21
LDI r3, 125
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
