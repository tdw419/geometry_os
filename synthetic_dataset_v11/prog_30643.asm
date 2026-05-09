; DESCRIPTION: Draws a cyan line from (200, 183) to (202, 213).
; PLAN: r0=200(x1), r1=183(y1), r2=202(x2), r3=213(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 183
LDI r2, 202
LDI r3, 213
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
