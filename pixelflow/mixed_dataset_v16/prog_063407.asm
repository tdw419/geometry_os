; DESCRIPTION: Draws a white line from (269, 152) to (50, 128).
; PLAN: r0=269(x1), r1=152(y1), r2=50(x2), r3=128(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 152
LDI r2, 50
LDI r3, 128
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
