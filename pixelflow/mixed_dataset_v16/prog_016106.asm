; DESCRIPTION: Composite: Places a black 103x78 rectangle at position (125, 81) then Places a white line segment connecting (502, 133) to (284, 157) then Sets a single cyan pixel at (255, 7).
; PLAN: r0=125(x), r1=81(y), r2=103(width), r3=78(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=502(x1), r6=133(y1), r7=284(x2), r8=157(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=255(x), r11=7(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 125
LDI r1, 81
LDI r2, 103
LDI r3, 78
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 502
LDI r6, 133
LDI r7, 284
LDI r8, 157
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 255
LDI r11, 7
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
