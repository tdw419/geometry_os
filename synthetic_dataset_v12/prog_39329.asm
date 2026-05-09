; DESCRIPTION: Draws a green line from (487, 235) to (294, 148).
; PLAN: r0=487(x1), r1=235(y1), r2=294(x2), r3=148(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 235
LDI r2, 294
LDI r3, 148
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
