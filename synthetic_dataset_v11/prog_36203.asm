; DESCRIPTION: Draws a cyan line from (150, 10) to (160, 69).
; PLAN: r0=150(x1), r1=10(y1), r2=160(x2), r3=69(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 10
LDI r2, 160
LDI r3, 69
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
