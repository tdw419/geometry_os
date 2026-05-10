; DESCRIPTION: Composite: Places a black line segment connecting (436, 48) to (372, 47) then Places a red 96x96 rectangle at position (281, 60).
; PLAN: r0=436(x1), r1=48(y1), r2=372(x2), r3=47(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=281(x), r6=60(y), r7=96(width), r8=96(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 436
LDI r1, 48
LDI r2, 372
LDI r3, 47
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 281
LDI r6, 60
LDI r7, 96
LDI r8, 96
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
