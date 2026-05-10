; DESCRIPTION: Composite: Renders a cyan line between points (1, 214) and (244, 254) then Places a blue 10x50 rectangle at position (371, 64).
; PLAN: r0=1(x1), r1=214(y1), r2=244(x2), r3=254(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=371(x), r6=64(y), r7=10(width), r8=50(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 1
LDI r1, 214
LDI r2, 244
LDI r3, 254
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 371
LDI r6, 64
LDI r7, 10
LDI r8, 50
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
