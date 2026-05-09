; DESCRIPTION: Draws a white line from (208, 45) to (242, 182).
; PLAN: r0=208(x1), r1=45(y1), r2=242(x2), r3=182(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 45
LDI r2, 242
LDI r3, 182
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
