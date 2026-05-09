; DESCRIPTION: Composite: Places a white 119x111 rectangle at position (373, 107) then Draws a red line from (328, 98) to (386, 62).
; PLAN: r0=373(x), r1=107(y), r2=119(width), r3=111(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=328(x1), r6=98(y1), r7=386(x2), r8=62(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 373
LDI r1, 107
LDI r2, 119
LDI r3, 111
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 328
LDI r6, 98
LDI r7, 386
LDI r8, 62
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
