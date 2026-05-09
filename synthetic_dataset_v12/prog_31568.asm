; DESCRIPTION: Draws a cyan line from (305, 87) to (257, 8).
; PLAN: r0=305(x1), r1=87(y1), r2=257(x2), r3=8(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 87
LDI r2, 257
LDI r3, 8
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
