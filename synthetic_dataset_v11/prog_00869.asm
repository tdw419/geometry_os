; DESCRIPTION: Draws a cyan line from (224, 3) to (79, 91).
; PLAN: r0=224(x1), r1=3(y1), r2=79(x2), r3=91(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 3
LDI r2, 79
LDI r3, 91
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
