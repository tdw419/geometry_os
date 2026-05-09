; DESCRIPTION: Composite: Places a green line segment connecting (1, 251) to (380, 50) then Places a blue dot at position (213, 213) then Places a orange 18x102 rectangle at position (255, 57).
; PLAN: r0=1(x1), r1=251(y1), r2=380(x2), r3=50(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=213(x), r6=213(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=255(x), r11=57(y), r12=18(width), r13=102(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 1
LDI r1, 251
LDI r2, 380
LDI r3, 50
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 213
LDI r6, 213
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 255
LDI r11, 57
LDI r12, 18
LDI r13, 102
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
