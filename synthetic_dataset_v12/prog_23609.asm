; DESCRIPTION: Composite: Draws a cyan line from (31, 96) to (277, 254) then Places a green 99x69 rectangle at position (154, 166).
; PLAN: r0=31(x1), r1=96(y1), r2=277(x2), r3=254(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=154(x), r6=166(y), r7=99(width), r8=69(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 31
LDI r1, 96
LDI r2, 277
LDI r3, 254
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 154
LDI r6, 166
LDI r7, 99
LDI r8, 69
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
