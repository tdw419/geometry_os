; DESCRIPTION: Draws a cyan line from (66, 13) to (21, 236).
; PLAN: r0=66(x1), r1=13(y1), r2=21(x2), r3=236(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 13
LDI r2, 21
LDI r3, 236
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
