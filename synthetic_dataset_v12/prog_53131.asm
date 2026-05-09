; DESCRIPTION: Composite: Draws a cyan line from (98, 154) to (103, 120) then Places a orange 120x49 rectangle at position (51, 156).
; PLAN: r0=98(x1), r1=154(y1), r2=103(x2), r3=120(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=51(x), r6=156(y), r7=120(width), r8=49(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 98
LDI r1, 154
LDI r2, 103
LDI r3, 120
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 51
LDI r6, 156
LDI r7, 120
LDI r8, 49
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
