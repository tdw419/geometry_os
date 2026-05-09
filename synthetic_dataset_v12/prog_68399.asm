; DESCRIPTION: Composite: Renders a blue line between points (87, 67) and (308, 95) then Places a cyan 34x113 rectangle at position (458, 70).
; PLAN: r0=87(x1), r1=67(y1), r2=308(x2), r3=95(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=458(x), r6=70(y), r7=34(width), r8=113(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 87
LDI r1, 67
LDI r2, 308
LDI r3, 95
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 458
LDI r6, 70
LDI r7, 34
LDI r8, 113
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
