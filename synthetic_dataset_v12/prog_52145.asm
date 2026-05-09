; DESCRIPTION: Composite: Places a red circle of radius 57 at center (72, 83) then Places a green line segment connecting (479, 228) to (482, 100).
; PLAN: r0=72(x), r1=83(y), r2=57(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=479(x1), r6=228(y1), r7=482(x2), r8=100(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 72
LDI r1, 83
LDI r2, 57
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 479
LDI r6, 228
LDI r7, 482
LDI r8, 100
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
