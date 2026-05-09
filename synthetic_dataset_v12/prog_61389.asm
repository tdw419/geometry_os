; DESCRIPTION: Draws a white line from (86, 129) to (405, 152).
; PLAN: r0=86(x1), r1=129(y1), r2=405(x2), r3=152(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 129
LDI r2, 405
LDI r3, 152
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
