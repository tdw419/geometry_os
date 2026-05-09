; DESCRIPTION: Places a cyan line segment connecting (64, 94) to (32, 117).
; PLAN: r0=64(x1), r1=94(y1), r2=32(x2), r3=117(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 94
LDI r2, 32
LDI r3, 117
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
