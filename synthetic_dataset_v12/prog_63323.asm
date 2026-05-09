; DESCRIPTION: Composite: Draws a black line from (152, 81) to (504, 32) then Places a green 23x83 rectangle at position (371, 19).
; PLAN: r0=152(x1), r1=81(y1), r2=504(x2), r3=32(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=371(x), r6=19(y), r7=23(width), r8=83(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 152
LDI r1, 81
LDI r2, 504
LDI r3, 32
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 371
LDI r6, 19
LDI r7, 23
LDI r8, 83
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
