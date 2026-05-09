; DESCRIPTION: Composite: Places a green 59x35 rectangle at position (410, 41) then Renders a green line between points (72, 93) and (397, 170).
; PLAN: r0=410(x), r1=41(y), r2=59(width), r3=35(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=72(x1), r6=93(y1), r7=397(x2), r8=170(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 410
LDI r1, 41
LDI r2, 59
LDI r3, 35
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 72
LDI r6, 93
LDI r7, 397
LDI r8, 170
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
