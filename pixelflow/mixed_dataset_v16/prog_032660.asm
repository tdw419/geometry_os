; DESCRIPTION: Composite: Renders a red line between points (374, 25) and (216, 202) then Places a green dot at position (202, 242).
; PLAN: r0=374(x1), r1=25(y1), r2=216(x2), r3=202(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=202(x), r6=242(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 374
LDI r1, 25
LDI r2, 216
LDI r3, 202
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 202
LDI r6, 242
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
