; DESCRIPTION: Composite: . Then Renders a white line between points (202, 74) and (227, 45). Then Draws a cyan rectangle at (122, 13) with width 102 and height 95.
; PLAN: r0=202(x1), r1=74(y1), r2=227(x2), r3=45(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=122(x), r1=13(y), r2=102(width), r3=95(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a white line between points (202, 74) and (227, 45).
; PLAN: r0=202(x1), r1=74(y1), r2=227(x2), r3=45(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 74
LDI r2, 227
LDI r3, 45
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a cyan rectangle at (122, 13) with width 102 and height 95.
; PLAN: r0=122(x), r1=13(y), r2=102(width), r3=95(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 13
LDI r2, 102
LDI r3, 95
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
