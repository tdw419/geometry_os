; DESCRIPTION: Draws a cyan line from (126, 202) to (242, 235).
; PLAN: r0=126(x1), r1=202(y1), r2=242(x2), r3=235(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 202
LDI r2, 242
LDI r3, 235
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
