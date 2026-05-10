; DESCRIPTION: Draws a cyan line from (14, 253) to (275, 207).
; PLAN: r0=14(x1), r1=253(y1), r2=275(x2), r3=207(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 253
LDI r2, 275
LDI r3, 207
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
