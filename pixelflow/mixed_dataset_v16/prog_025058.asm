; DESCRIPTION: Composite: Renders a orange disk with center (80, 173) and radius 69 then Places a cyan line segment connecting (385, 128) to (345, 82).
; PLAN: r0=80(x), r1=173(y), r2=69(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=385(x1), r6=128(y1), r7=345(x2), r8=82(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 80
LDI r1, 173
LDI r2, 69
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 385
LDI r6, 128
LDI r7, 345
LDI r8, 82
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
