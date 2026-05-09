; DESCRIPTION: Draws a white line from (42, 22) to (243, 150).
; PLAN: r0=42(x1), r1=22(y1), r2=243(x2), r3=150(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 22
LDI r2, 243
LDI r3, 150
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
