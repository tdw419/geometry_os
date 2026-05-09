; DESCRIPTION: Composite: Places a white 95x48 rectangle at position (296, 185) then Places a white line segment connecting (231, 0) to (466, 61).
; PLAN: r0=296(x), r1=185(y), r2=95(width), r3=48(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=231(x1), r6=0(y1), r7=466(x2), r8=61(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 296
LDI r1, 185
LDI r2, 95
LDI r3, 48
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 231
LDI r6, 0
LDI r7, 466
LDI r8, 61
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
