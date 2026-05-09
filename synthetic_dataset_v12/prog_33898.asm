; DESCRIPTION: Draws a cyan line from (373, 126) to (273, 209).
; PLAN: r0=373(x1), r1=126(y1), r2=273(x2), r3=209(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 126
LDI r2, 273
LDI r3, 209
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
