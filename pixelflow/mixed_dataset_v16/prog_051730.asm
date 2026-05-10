; DESCRIPTION: Draws a cyan line from (410, 91) to (117, 95).
; PLAN: r0=410(x1), r1=91(y1), r2=117(x2), r3=95(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 91
LDI r2, 117
LDI r3, 95
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
