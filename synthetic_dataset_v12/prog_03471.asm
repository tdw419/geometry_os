; DESCRIPTION: Composite: Creates a cyan circular shape at (311, 89) with radius 21 then Places a blue dot at position (48, 64) then Renders a cyan box of size 50x59 starting at (96, 55).
; PLAN: r0=311(x), r1=89(y), r2=21(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=48(x), r6=64(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=96(x), r11=55(y), r12=50(width), r13=59(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 311
LDI r1, 89
LDI r2, 21
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 48
LDI r6, 64
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 96
LDI r11, 55
LDI r12, 50
LDI r13, 59
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
