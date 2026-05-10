; DESCRIPTION: Places a cyan line segment connecting (304, 226) to (196, 111).
; PLAN: r0=304(x1), r1=226(y1), r2=196(x2), r3=111(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 226
LDI r2, 196
LDI r3, 111
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
