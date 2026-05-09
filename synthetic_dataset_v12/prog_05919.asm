; DESCRIPTION: Draws a cyan line from (243, 91) to (126, 246).
; PLAN: r0=243(x1), r1=91(y1), r2=126(x2), r3=246(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 91
LDI r2, 126
LDI r3, 246
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
