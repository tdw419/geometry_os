; DESCRIPTION: Draws a cyan line from (391, 197) to (492, 62).
; PLAN: r0=391(x1), r1=197(y1), r2=492(x2), r3=62(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 197
LDI r2, 492
LDI r3, 62
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
