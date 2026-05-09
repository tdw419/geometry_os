; DESCRIPTION: Places a cyan line segment connecting (226, 45) to (354, 242).
; PLAN: r0=226(x1), r1=45(y1), r2=354(x2), r3=242(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 45
LDI r2, 354
LDI r3, 242
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
