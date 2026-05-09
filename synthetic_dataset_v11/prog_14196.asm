; DESCRIPTION: Places a cyan line segment connecting (254, 196) to (186, 235).
; PLAN: r0=254(x1), r1=196(y1), r2=186(x2), r3=235(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 196
LDI r2, 186
LDI r3, 235
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
