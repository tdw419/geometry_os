; DESCRIPTION: Draws a cyan line from (112, 128) to (152, 247).
; PLAN: r0=112(x1), r1=128(y1), r2=152(x2), r3=247(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 128
LDI r2, 152
LDI r3, 247
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
