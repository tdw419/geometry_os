; DESCRIPTION: Places a cyan line segment connecting (48, 152) to (257, 237).
; PLAN: r0=48(x1), r1=152(y1), r2=257(x2), r3=237(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 152
LDI r2, 257
LDI r3, 237
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
