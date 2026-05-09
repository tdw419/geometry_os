; DESCRIPTION: Composite: Renders a cyan disk with center (127, 113) and radius 61 then Places a green dot at position (151, 77) then Places a black 32x117 rectangle at position (450, 56).
; PLAN: r0=127(x), r1=113(y), r2=61(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=151(x), r6=77(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=450(x), r11=56(y), r12=32(width), r13=117(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 127
LDI r1, 113
LDI r2, 61
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 151
LDI r6, 77
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 450
LDI r11, 56
LDI r12, 32
LDI r13, 117
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
