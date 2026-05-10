; DESCRIPTION: Draws a cyan line from (90, 195) to (352, 98).
; PLAN: r0=90(x1), r1=195(y1), r2=352(x2), r3=98(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 195
LDI r2, 352
LDI r3, 98
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
