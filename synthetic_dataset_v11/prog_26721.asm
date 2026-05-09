; DESCRIPTION: Composite: . Then Creates a cyan rectangular region at (11, 121) spanning 32 by 101 pixels. Then Renders a cyan line between points (159, 252) and (19, 221).
; PLAN: r0=11(x), r1=121(y), r2=32(width), r3=101(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=159(x1), r1=252(y1), r2=19(x2), r3=221(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a cyan rectangular region at (11, 121) spanning 32 by 101 pixels.
; PLAN: r0=11(x), r1=121(y), r2=32(width), r3=101(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 121
LDI r2, 32
LDI r3, 101
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a cyan line between points (159, 252) and (19, 221).
; PLAN: r0=159(x1), r1=252(y1), r2=19(x2), r3=221(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 252
LDI r2, 19
LDI r3, 221
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
