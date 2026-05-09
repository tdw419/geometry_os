; DESCRIPTION: Composite: Places a cyan 19x69 rectangle at position (370, 105) then Draws a orange line from (402, 237) to (365, 193).
; PLAN: r0=370(x), r1=105(y), r2=19(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=402(x1), r6=237(y1), r7=365(x2), r8=193(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 370
LDI r1, 105
LDI r2, 19
LDI r3, 69
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 402
LDI r6, 237
LDI r7, 365
LDI r8, 193
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
