; DESCRIPTION: Draws a cyan line from (462, 18) to (180, 27).
; PLAN: r0=462(x1), r1=18(y1), r2=180(x2), r3=27(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 18
LDI r2, 180
LDI r3, 27
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
