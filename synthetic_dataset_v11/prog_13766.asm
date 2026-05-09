; DESCRIPTION: Renders a red line between points (224, 197) and (225, 198).
; PLAN: r0=224(x1), r1=197(y1), r2=225(x2), r3=198(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 197
LDI r2, 225
LDI r3, 198
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
