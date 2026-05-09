; DESCRIPTION: Composite: Draws a cyan line from (322, 84) to (53, 50) then Renders a white box of size 50x27 starting at (110, 164).
; PLAN: r0=322(x1), r1=84(y1), r2=53(x2), r3=50(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=110(x), r6=164(y), r7=50(width), r8=27(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 322
LDI r1, 84
LDI r2, 53
LDI r3, 50
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 110
LDI r6, 164
LDI r7, 50
LDI r8, 27
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
