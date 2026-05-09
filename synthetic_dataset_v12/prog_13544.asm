; DESCRIPTION: Draws a cyan line from (180, 48) to (253, 152).
; PLAN: r0=180(x1), r1=48(y1), r2=253(x2), r3=152(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 48
LDI r2, 253
LDI r3, 152
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
