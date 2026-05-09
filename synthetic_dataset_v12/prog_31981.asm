; DESCRIPTION: Draws a red line from (224, 207) to (60, 187).
; PLAN: r0=224(x1), r1=207(y1), r2=60(x2), r3=187(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 207
LDI r2, 60
LDI r3, 187
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
