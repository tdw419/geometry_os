; DESCRIPTION: Draws a cyan line from (233, 210) to (106, 111).
; PLAN: r0=233(x1), r1=210(y1), r2=106(x2), r3=111(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 210
LDI r2, 106
LDI r3, 111
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
