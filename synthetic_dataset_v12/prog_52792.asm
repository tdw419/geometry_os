; DESCRIPTION: Composite: Renders a magenta line between points (440, 214) and (60, 243) then Renders a cyan disk with center (304, 98) and radius 25.
; PLAN: r0=440(x1), r1=214(y1), r2=60(x2), r3=243(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=304(x), r6=98(y), r7=25(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 440
LDI r1, 214
LDI r2, 60
LDI r3, 243
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 304
LDI r6, 98
LDI r7, 25
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
