; DESCRIPTION: Composite: Renders a green disk with center (435, 109) and radius 30 then Renders a black box of size 50x56 starting at (73, 34) then Places a blue dot at position (313, 164).
; PLAN: r0=435(x), r1=109(y), r2=30(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=73(x), r6=34(y), r7=50(width), r8=56(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=313(x), r11=164(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 435
LDI r1, 109
LDI r2, 30
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 73
LDI r6, 34
LDI r7, 50
LDI r8, 56
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 313
LDI r11, 164
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
