; DESCRIPTION: Renders a cyan line between points (276, 84) and (346, 243).
; PLAN: r0=276(x1), r1=84(y1), r2=346(x2), r3=243(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 84
LDI r2, 346
LDI r3, 243
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
