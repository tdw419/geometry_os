; DESCRIPTION: Composite: Renders a white line between points (4, 23) and (435, 82) then Places a magenta 102x113 rectangle at position (406, 25).
; PLAN: r0=4(x1), r1=23(y1), r2=435(x2), r3=82(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=406(x), r6=25(y), r7=102(width), r8=113(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 4
LDI r1, 23
LDI r2, 435
LDI r3, 82
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 406
LDI r6, 25
LDI r7, 102
LDI r8, 113
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
