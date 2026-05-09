; DESCRIPTION: Draws a white line from (480, 9) to (7, 32).
; PLAN: r0=480(x1), r1=9(y1), r2=7(x2), r3=32(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 9
LDI r2, 7
LDI r3, 32
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
