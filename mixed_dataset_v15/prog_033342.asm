; DESCRIPTION: Composite: Renders a purple box of size 67x34 starting at (62, 64) then Renders a cyan line between points (308, 60) and (452, 247).
; PLAN: r0=62(x), r1=64(y), r2=67(width), r3=34(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=308(x1), r6=60(y1), r7=452(x2), r8=247(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 62
LDI r1, 64
LDI r2, 67
LDI r3, 34
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 308
LDI r6, 60
LDI r7, 452
LDI r8, 247
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
