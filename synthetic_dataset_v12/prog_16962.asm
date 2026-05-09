; DESCRIPTION: Composite: Places a yellow 108x80 rectangle at position (61, 111) then Renders a yellow line between points (315, 249) and (510, 46).
; PLAN: r0=61(x), r1=111(y), r2=108(width), r3=80(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=315(x1), r6=249(y1), r7=510(x2), r8=46(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 61
LDI r1, 111
LDI r2, 108
LDI r3, 80
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 315
LDI r6, 249
LDI r7, 510
LDI r8, 46
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
