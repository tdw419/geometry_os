; DESCRIPTION: Draws a cyan line from (437, 151) to (215, 178).
; PLAN: r0=437(x1), r1=151(y1), r2=215(x2), r3=178(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 151
LDI r2, 215
LDI r3, 178
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
