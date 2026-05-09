; DESCRIPTION: Draws a white diagonal line from the top-left (0, 0) to the bottom-right (255, 255).
; PLAN: r0=150(x1), r1=16(y1), r2=229(x2), r3=23(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 131
LDI r2, 100
LDI r3, 10
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT