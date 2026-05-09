; DESCRIPTION: Draws a cyan line from (253, 31) to (154, 255).
; PLAN: r0=253(x1), r1=31(y1), r2=154(x2), r3=255(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 31
LDI r2, 154
LDI r3, 255
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
