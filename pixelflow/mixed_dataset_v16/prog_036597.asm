; DESCRIPTION: Composite: Creates a cyan circular shape at (61, 168) with radius 17 then Renders a yellow line between points (208, 243) and (400, 35) then Places a cyan dot at position (397, 47).
; PLAN: r0=61(x), r1=168(y), r2=17(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=208(x1), r6=243(y1), r7=400(x2), r8=35(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=397(x), r11=47(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 61
LDI r1, 168
LDI r2, 17
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 208
LDI r6, 243
LDI r7, 400
LDI r8, 35
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 397
LDI r11, 47
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
