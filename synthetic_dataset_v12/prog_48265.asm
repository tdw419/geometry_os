; DESCRIPTION: Composite: Renders a cyan line between points (237, 13) and (33, 23) then Renders a cyan box of size 67x115 starting at (292, 23).
; PLAN: r0=237(x1), r1=13(y1), r2=33(x2), r3=23(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=292(x), r6=23(y), r7=67(width), r8=115(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 237
LDI r1, 13
LDI r2, 33
LDI r3, 23
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 292
LDI r6, 23
LDI r7, 67
LDI r8, 115
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
