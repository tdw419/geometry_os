; DESCRIPTION: Places a cyan line segment connecting (288, 28) to (275, 128).
; PLAN: r0=288(x1), r1=28(y1), r2=275(x2), r3=128(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 28
LDI r2, 275
LDI r3, 128
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
