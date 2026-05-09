; DESCRIPTION: Draws a green line from (446, 190) to (32, 126).
; PLAN: r0=446(x1), r1=190(y1), r2=32(x2), r3=126(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 190
LDI r2, 32
LDI r3, 126
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
