; DESCRIPTION: Composite: Places a white 36x42 rectangle at position (308, 211) then Places a black line segment connecting (322, 228) to (357, 58).
; PLAN: r0=308(x), r1=211(y), r2=36(width), r3=42(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=322(x1), r6=228(y1), r7=357(x2), r8=58(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 308
LDI r1, 211
LDI r2, 36
LDI r3, 42
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 322
LDI r6, 228
LDI r7, 357
LDI r8, 58
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
