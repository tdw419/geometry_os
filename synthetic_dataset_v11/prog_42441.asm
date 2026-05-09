; DESCRIPTION: Draws a cyan line from (118, 226) to (215, 19).
; PLAN: r0=118(x1), r1=226(y1), r2=215(x2), r3=19(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 226
LDI r2, 215
LDI r3, 19
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
