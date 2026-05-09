; DESCRIPTION: Renders a cyan line between points (101, 178) and (153, 111).
; PLAN: r0=101(x1), r1=178(y1), r2=153(x2), r3=111(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 178
LDI r2, 153
LDI r3, 111
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
