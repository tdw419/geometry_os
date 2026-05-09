; DESCRIPTION: Places a cyan line segment connecting (218, 195) to (235, 111).
; PLAN: r0=218(x1), r1=195(y1), r2=235(x2), r3=111(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 195
LDI r2, 235
LDI r3, 111
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
