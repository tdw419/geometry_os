; DESCRIPTION: Composite: Places a black 56x94 rectangle at position (442, 21) then Renders a cyan disk with center (168, 164) and radius 56.
; PLAN: r0=442(x), r1=21(y), r2=56(width), r3=94(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=168(x), r6=164(y), r7=56(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 442
LDI r1, 21
LDI r2, 56
LDI r3, 94
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 168
LDI r6, 164
LDI r7, 56
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
