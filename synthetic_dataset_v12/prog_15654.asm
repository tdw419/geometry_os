; DESCRIPTION: Places a white line segment connecting (255, 215) to (439, 91).
; PLAN: r0=255(x1), r1=215(y1), r2=439(x2), r3=91(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 215
LDI r2, 439
LDI r3, 91
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
