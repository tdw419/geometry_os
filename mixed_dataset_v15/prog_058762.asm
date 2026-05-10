; DESCRIPTION: Draws a cyan line from (456, 183) to (228, 138).
; PLAN: r0=456(x1), r1=183(y1), r2=228(x2), r3=138(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 183
LDI r2, 228
LDI r3, 138
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
