; DESCRIPTION: Composite: Places a cyan line segment connecting (294, 57) to (303, 195) then Places a white 97x115 rectangle at position (362, 80).
; PLAN: r0=294(x1), r1=57(y1), r2=303(x2), r3=195(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=362(x), r6=80(y), r7=97(width), r8=115(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 294
LDI r1, 57
LDI r2, 303
LDI r3, 195
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 362
LDI r6, 80
LDI r7, 97
LDI r8, 115
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
