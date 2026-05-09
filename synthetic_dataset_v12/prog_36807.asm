; DESCRIPTION: Draws a white line from (242, 71) to (371, 120).
; PLAN: r0=242(x1), r1=71(y1), r2=371(x2), r3=120(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 71
LDI r2, 371
LDI r3, 120
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
