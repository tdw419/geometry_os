; DESCRIPTION: Composite: Sets a single cyan pixel at (450, 32) then Creates a green circular shape at (352, 81) with radius 42 then Renders a purple line between points (42, 131) and (505, 180).
; PLAN: r0=450(x), r1=32(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=352(x), r6=81(y), r7=42(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=42(x1), r11=131(y1), r12=505(x2), r13=180(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 450
LDI r1, 32
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 352
LDI r6, 81
LDI r7, 42
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 42
LDI r11, 131
LDI r12, 505
LDI r13, 180
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
