; DESCRIPTION: Composite: Draws a green line from (507, 44) to (142, 50) then Places a magenta circle of radius 48 at center (397, 93) then Places a cyan dot at position (305, 125).
; PLAN: r0=507(x1), r1=44(y1), r2=142(x2), r3=50(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=397(x), r6=93(y), r7=48(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=305(x), r11=125(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 507
LDI r1, 44
LDI r2, 142
LDI r3, 50
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 397
LDI r6, 93
LDI r7, 48
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 305
LDI r11, 125
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
