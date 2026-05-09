; DESCRIPTION: Composite: Renders a cyan line between points (87, 60) and (295, 124) then Creates a magenta circular shape at (406, 135) with radius 47 then Places a orange dot at position (315, 64).
; PLAN: r0=87(x1), r1=60(y1), r2=295(x2), r3=124(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=406(x), r6=135(y), r7=47(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=315(x), r11=64(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 87
LDI r1, 60
LDI r2, 295
LDI r3, 124
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 406
LDI r6, 135
LDI r7, 47
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 315
LDI r11, 64
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
