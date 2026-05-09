; DESCRIPTION: Composite: Draws a green line from (175, 13) to (38, 200) then Places a white dot at position (281, 184).
; PLAN: r0=175(x1), r1=13(y1), r2=38(x2), r3=200(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=281(x), r6=184(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 175
LDI r1, 13
LDI r2, 38
LDI r3, 200
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 281
LDI r6, 184
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
