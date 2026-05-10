; DESCRIPTION: Draws a green line from (295, 135) to (290, 187).
; PLAN: r0=295(x1), r1=135(y1), r2=290(x2), r3=187(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 135
LDI r2, 290
LDI r3, 187
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
