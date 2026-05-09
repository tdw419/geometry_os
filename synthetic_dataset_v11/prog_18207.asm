; DESCRIPTION: Composite: . Then Renders a cyan line between points (192, 231) and (180, 245). Then Places a purple circle of radius 12 at center (225, 55).
; PLAN: r0=192(x1), r1=231(y1), r2=180(x2), r3=245(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=225(x), r1=55(y), r2=12(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a cyan line between points (192, 231) and (180, 245).
; PLAN: r0=192(x1), r1=231(y1), r2=180(x2), r3=245(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 231
LDI r2, 180
LDI r3, 245
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple circle of radius 12 at center (225, 55).
; PLAN: r0=225(x), r1=55(y), r2=12(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 225
LDI r1, 55
LDI r2, 12
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
