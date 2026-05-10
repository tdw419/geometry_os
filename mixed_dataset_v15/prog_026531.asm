; DESCRIPTION: Draws a cyan line from (268, 254) to (56, 242).
; PLAN: r0=268(x1), r1=254(y1), r2=56(x2), r3=242(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 254
LDI r2, 56
LDI r3, 242
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
