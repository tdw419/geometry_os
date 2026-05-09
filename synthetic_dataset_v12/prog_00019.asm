; DESCRIPTION: Composite: Places a cyan circle of radius 20 at center (213, 181) then Places a blue 117x51 rectangle at position (164, 183).
; PLAN: r0=213(x), r1=181(y), r2=20(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=164(x), r6=183(y), r7=117(width), r8=51(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 213
LDI r1, 181
LDI r2, 20
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 164
LDI r6, 183
LDI r7, 117
LDI r8, 51
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
