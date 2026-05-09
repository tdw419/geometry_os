; DESCRIPTION: Composite: Renders a white disk with center (448, 134) and radius 60 then Renders a yellow box of size 91x113 starting at (120, 1) then Places a magenta dot at position (90, 32).
; PLAN: r0=448(x), r1=134(y), r2=60(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=120(x), r6=1(y), r7=91(width), r8=113(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=90(x), r11=32(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 448
LDI r1, 134
LDI r2, 60
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 120
LDI r6, 1
LDI r7, 91
LDI r8, 113
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 90
LDI r11, 32
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
