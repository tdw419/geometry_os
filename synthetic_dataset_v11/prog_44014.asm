; DESCRIPTION: Renders a cyan line between points (39, 253) and (207, 86).
; PLAN: r0=39(x1), r1=253(y1), r2=207(x2), r3=86(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 253
LDI r2, 207
LDI r3, 86
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
