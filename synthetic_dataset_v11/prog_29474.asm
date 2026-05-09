; DESCRIPTION: Composite: . Then Draws a white rectangle at (209, 42) with width 45 and height 54. Then Renders a cyan line between points (58, 56) and (225, 34).
; PLAN: r0=209(x), r1=42(y), r2=45(width), r3=54(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=58(x1), r1=56(y1), r2=225(x2), r3=34(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a white rectangle at (209, 42) with width 45 and height 54.
; PLAN: r0=209(x), r1=42(y), r2=45(width), r3=54(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 42
LDI r2, 45
LDI r3, 54
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a cyan line between points (58, 56) and (225, 34).
; PLAN: r0=58(x1), r1=56(y1), r2=225(x2), r3=34(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 56
LDI r2, 225
LDI r3, 34
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
