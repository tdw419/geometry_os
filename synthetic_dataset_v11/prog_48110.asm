; DESCRIPTION: Draws a cyan line from (4, 152) to (201, 186).
; PLAN: r0=4(x1), r1=152(y1), r2=201(x2), r3=186(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 152
LDI r2, 201
LDI r3, 186
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
