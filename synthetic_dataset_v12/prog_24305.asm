; DESCRIPTION: Places a cyan line segment connecting (235, 90) to (255, 236).
; PLAN: r0=235(x1), r1=90(y1), r2=255(x2), r3=236(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 90
LDI r2, 255
LDI r3, 236
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
