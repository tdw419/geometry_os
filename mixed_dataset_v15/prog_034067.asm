; DESCRIPTION: Composite: Places a red 29x40 rectangle at position (469, 196) then Places a cyan line segment connecting (33, 138) to (182, 42).
; PLAN: r0=469(x), r1=196(y), r2=29(width), r3=40(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=33(x1), r6=138(y1), r7=182(x2), r8=42(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 469
LDI r1, 196
LDI r2, 29
LDI r3, 40
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 33
LDI r6, 138
LDI r7, 182
LDI r8, 42
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
