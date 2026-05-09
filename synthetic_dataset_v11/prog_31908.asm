; DESCRIPTION: Composite: . Then Draws a red rectangle at (31, 218) with width 102 and height 36. Then Renders a cyan line between points (108, 195) and (249, 237).
; PLAN: r0=31(x), r1=218(y), r2=102(width), r3=36(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=108(x1), r1=195(y1), r2=249(x2), r3=237(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a red rectangle at (31, 218) with width 102 and height 36.
; PLAN: r0=31(x), r1=218(y), r2=102(width), r3=36(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 218
LDI r2, 102
LDI r3, 36
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a cyan line between points (108, 195) and (249, 237).
; PLAN: r0=108(x1), r1=195(y1), r2=249(x2), r3=237(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 195
LDI r2, 249
LDI r3, 237
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
