; DESCRIPTION: Draws a cyan line from (206, 197) to (187, 211).
; PLAN: r0=206(x1), r1=197(y1), r2=187(x2), r3=211(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 197
LDI r2, 187
LDI r3, 211
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
