; DESCRIPTION: Composite: Places a cyan line segment connecting (60, 99) to (156, 36) then Places a blue 27x59 rectangle at position (180, 55).
; PLAN: r0=60(x1), r1=99(y1), r2=156(x2), r3=36(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=180(x), r6=55(y), r7=27(width), r8=59(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 60
LDI r1, 99
LDI r2, 156
LDI r3, 36
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 180
LDI r6, 55
LDI r7, 27
LDI r8, 59
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
