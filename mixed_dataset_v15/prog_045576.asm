; DESCRIPTION: Renders a cyan line between points (175, 245) and (473, 255).
; PLAN: r0=175(x1), r1=245(y1), r2=473(x2), r3=255(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 245
LDI r2, 473
LDI r3, 255
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
