; DESCRIPTION: Composite: Renders a magenta box of size 35x77 starting at (180, 145) then Places a yellow circle of radius 26 at center (57, 165).
; PLAN: r0=180(x), r1=145(y), r2=35(width), r3=77(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=57(x), r6=165(y), r7=26(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 180
LDI r1, 145
LDI r2, 35
LDI r3, 77
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 57
LDI r6, 165
LDI r7, 26
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
