; DESCRIPTION: Composite: Draws a cyan line from (95, 124) to (239, 231) then Places a black 96x80 rectangle at position (279, 53).
; PLAN: r0=95(x1), r1=124(y1), r2=239(x2), r3=231(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=279(x), r6=53(y), r7=96(width), r8=80(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 95
LDI r1, 124
LDI r2, 239
LDI r3, 231
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 279
LDI r6, 53
LDI r7, 96
LDI r8, 80
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
