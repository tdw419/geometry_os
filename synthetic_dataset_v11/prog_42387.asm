; DESCRIPTION: Composite: . Then Renders a cyan line between points (208, 59) and (171, 122). Then Places a purple 54x18 rectangle at position (37, 81).
; PLAN: r0=208(x1), r1=59(y1), r2=171(x2), r3=122(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=37(x), r1=81(y), r2=54(width), r3=18(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a cyan line between points (208, 59) and (171, 122).
; PLAN: r0=208(x1), r1=59(y1), r2=171(x2), r3=122(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 59
LDI r2, 171
LDI r3, 122
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple 54x18 rectangle at position (37, 81).
; PLAN: r0=37(x), r1=81(y), r2=54(width), r3=18(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 81
LDI r2, 54
LDI r3, 18
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
