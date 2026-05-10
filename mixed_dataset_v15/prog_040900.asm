; DESCRIPTION: Composite: Places a red dot at position (488, 204) then Renders a cyan line between points (23, 254) and (196, 68) then Places a blue 111x33 rectangle at position (231, 84).
; PLAN: r0=488(x), r1=204(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=23(x1), r6=254(y1), r7=196(x2), r8=68(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=231(x), r11=84(y), r12=111(width), r13=33(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 488
LDI r1, 204
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 23
LDI r6, 254
LDI r7, 196
LDI r8, 68
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 231
LDI r11, 84
LDI r12, 111
LDI r13, 33
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
