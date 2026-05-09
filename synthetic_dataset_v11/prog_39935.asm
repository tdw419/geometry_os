; DESCRIPTION: Composite: . Then Renders a cyan line between points (171, 108) and (15, 223). Then Draws a white rectangle at (59, 4) with width 114 and height 114.
; PLAN: r0=171(x1), r1=108(y1), r2=15(x2), r3=223(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=59(x), r1=4(y), r2=114(width), r3=114(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a cyan line between points (171, 108) and (15, 223).
; PLAN: r0=171(x1), r1=108(y1), r2=15(x2), r3=223(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 108
LDI r2, 15
LDI r3, 223
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a white rectangle at (59, 4) with width 114 and height 114.
; PLAN: r0=59(x), r1=4(y), r2=114(width), r3=114(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 4
LDI r2, 114
LDI r3, 114
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
