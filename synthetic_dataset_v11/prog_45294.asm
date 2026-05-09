; DESCRIPTION: Draws a cyan line from (224, 69) to (91, 26).
; PLAN: r0=224(x1), r1=69(y1), r2=91(x2), r3=26(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 69
LDI r2, 91
LDI r3, 26
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
