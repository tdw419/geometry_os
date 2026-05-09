; DESCRIPTION: Draws a red line from (224, 0) to (173, 213).
; PLAN: r0=224(x1), r1=0(y1), r2=173(x2), r3=213(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 0
LDI r2, 173
LDI r3, 213
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
