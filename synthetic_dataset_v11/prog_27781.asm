; DESCRIPTION: Composite: . Then Draws a cyan line from (171, 139) to (128, 167). Then Draws a yellow rectangle at (143, 178) with width 27 and height 31.
; PLAN: r0=171(x1), r1=139(y1), r2=128(x2), r3=167(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=143(x), r1=178(y), r2=27(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a cyan line from (171, 139) to (128, 167).
; PLAN: r0=171(x1), r1=139(y1), r2=128(x2), r3=167(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 139
LDI r2, 128
LDI r3, 167
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a yellow rectangle at (143, 178) with width 27 and height 31.
; PLAN: r0=143(x), r1=178(y), r2=27(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 178
LDI r2, 27
LDI r3, 31
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
