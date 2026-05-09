; DESCRIPTION: Draws a white line from (502, 12) to (218, 243).
; PLAN: r0=502(x1), r1=12(y1), r2=218(x2), r3=243(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 12
LDI r2, 218
LDI r3, 243
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
