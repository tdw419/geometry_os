; DESCRIPTION: Composite: Sets a single cyan pixel at (182, 209) then Renders a green disk with center (480, 93) and radius 26 then Renders a blue box of size 21x36 starting at (471, 113).
; PLAN: r0=182(x), r1=209(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=480(x), r6=93(y), r7=26(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=471(x), r11=113(y), r12=21(width), r13=36(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 182
LDI r1, 209
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 480
LDI r6, 93
LDI r7, 26
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 471
LDI r11, 113
LDI r12, 21
LDI r13, 36
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
