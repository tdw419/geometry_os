; DESCRIPTION: Renders a cyan line between points (209, 224) and (220, 221).
; PLAN: r0=209(x1), r1=224(y1), r2=220(x2), r3=221(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 224
LDI r2, 220
LDI r3, 221
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
