; DESCRIPTION: Draws a cyan line from (370, 175) to (352, 192).
; PLAN: r0=370(x1), r1=175(y1), r2=352(x2), r3=192(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 175
LDI r2, 352
LDI r3, 192
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
