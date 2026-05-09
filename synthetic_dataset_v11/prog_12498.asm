; DESCRIPTION: Draws a cyan line from (94, 233) to (209, 221).
; PLAN: r0=94(x1), r1=233(y1), r2=209(x2), r3=221(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 233
LDI r2, 209
LDI r3, 221
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
