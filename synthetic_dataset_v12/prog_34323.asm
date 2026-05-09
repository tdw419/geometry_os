; DESCRIPTION: Composite: Places a red line segment connecting (392, 90) to (213, 179) then Places a blue 111x92 rectangle at position (344, 111).
; PLAN: r0=392(x1), r1=90(y1), r2=213(x2), r3=179(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=344(x), r6=111(y), r7=111(width), r8=92(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 392
LDI r1, 90
LDI r2, 213
LDI r3, 179
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 344
LDI r6, 111
LDI r7, 111
LDI r8, 92
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
