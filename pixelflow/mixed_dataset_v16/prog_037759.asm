; DESCRIPTION: Composite: Renders a purple line between points (346, 96) and (242, 8) then Places a green dot at position (183, 223).
; PLAN: r0=346(x1), r1=96(y1), r2=242(x2), r3=8(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=183(x), r6=223(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 346
LDI r1, 96
LDI r2, 242
LDI r3, 8
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 183
LDI r6, 223
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
