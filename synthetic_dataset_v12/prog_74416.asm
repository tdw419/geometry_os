; DESCRIPTION: Draws a cyan line from (146, 60) to (88, 27).
; PLAN: r0=146(x1), r1=60(y1), r2=88(x2), r3=27(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 60
LDI r2, 88
LDI r3, 27
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
