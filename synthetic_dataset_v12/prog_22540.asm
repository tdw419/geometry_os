; DESCRIPTION: Composite: Renders a cyan line between points (194, 200) and (28, 49) then Places a green 67x70 rectangle at position (299, 160).
; PLAN: r0=194(x1), r1=200(y1), r2=28(x2), r3=49(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=299(x), r6=160(y), r7=67(width), r8=70(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 194
LDI r1, 200
LDI r2, 28
LDI r3, 49
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 299
LDI r6, 160
LDI r7, 67
LDI r8, 70
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
