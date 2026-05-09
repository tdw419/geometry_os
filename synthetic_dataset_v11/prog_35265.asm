; DESCRIPTION: Composite: . Then Renders a blue line between points (215, 143) and (87, 111). Then Places a blue dot at position (43, 133).
; PLAN: r0=215(x1), r1=143(y1), r2=87(x2), r3=111(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=43(x), r1=133(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a blue line between points (215, 143) and (87, 111).
; PLAN: r0=215(x1), r1=143(y1), r2=87(x2), r3=111(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 143
LDI r2, 87
LDI r3, 111
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a blue dot at position (43, 133).
; PLAN: r0=43(x), r1=133(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 43
LDI r1, 133
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
