; DESCRIPTION: Draws a cyan line from (510, 207) to (275, 202).
; PLAN: r0=510(x1), r1=207(y1), r2=275(x2), r3=202(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 207
LDI r2, 275
LDI r3, 202
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
