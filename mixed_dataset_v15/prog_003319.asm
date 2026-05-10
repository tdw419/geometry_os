; DESCRIPTION: Places a cyan line segment connecting (284, 87) to (33, 235).
; PLAN: r0=284(x1), r1=87(y1), r2=33(x2), r3=235(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 87
LDI r2, 33
LDI r3, 235
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
