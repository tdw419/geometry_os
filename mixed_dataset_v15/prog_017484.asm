; DESCRIPTION: Composite: Places a magenta 28x30 rectangle at position (404, 18) then Renders a green disk with center (149, 142) and radius 50.
; PLAN: r0=404(x), r1=18(y), r2=28(width), r3=30(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=149(x), r6=142(y), r7=50(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 404
LDI r1, 18
LDI r2, 28
LDI r3, 30
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 149
LDI r6, 142
LDI r7, 50
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
