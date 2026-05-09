; DESCRIPTION: Composite: Renders a orange disk with center (398, 132) and radius 48 then Places a green 46x15 rectangle at position (428, 5).
; PLAN: r0=398(x), r1=132(y), r2=48(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=428(x), r6=5(y), r7=46(width), r8=15(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 398
LDI r1, 132
LDI r2, 48
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 428
LDI r6, 5
LDI r7, 46
LDI r8, 15
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
